# Usage: git_pull_all.ps1 [-ForceDeleteAllLocalBranches]
# CLI: .\git_pull_all.ps1
# CLI: .\git_pull_all.ps1 -ForceDeleteAllLocalBranches
param(
    [switch]$ForceDeleteAllLocalBranches
)
Write-Host "Reminder you can force delete all local branches with the -ForceDeleteAllLocalBranches flag"
$originalLocation = Get-Location

$githubRoot = "C:\GitHub"
$orgDirs = Get-ChildItem -Path $githubRoot -Directory

foreach ($orgDir in $orgDirs) {
    Write-Host "Processing GitHub Organization: $($orgDir.FullName)"
    Set-Location $orgDir.FullName

    $projectDirs = Get-ChildItem -Path $orgDir.FullName -Directory
    foreach ($projectDir in $projectDirs) {
        Write-Host ""
        Write-Host "Processing Project: $($projectDir.FullName)"
        Set-Location $projectDir.FullName

        $defaultBranchOutput = git remote show origin
        $defaultBranch = ($defaultBranchOutput | Where-Object { $_ -match 'HEAD branch:' }) -replace '.*HEAD branch: ', ''
        Write-Host "Default branch: $defaultBranch"

        $currentBranch = git rev-parse --abbrev-ref HEAD
        Write-Host "Current branch: $currentBranch"


        if ($currentBranch -ne $defaultBranch) {
            Write-Host "Switching to default branch: $defaultBranch"
            git checkout $defaultBranch
        }

        git fetch --all -p
        git pull --all

        if (Test-Path ".gitmodules") {
            git submodule update --init --remote --force
        }

        if ($ForceDeleteAllLocalBranches -eq 1) {
            $localBranches = git for-each-ref --format '%(refname:short)' refs/heads
            $remoteBranchesRaw = git for-each-ref --format '%(refname:short)' refs/remotes/origin
            $remoteBranches = @()

            foreach ($remote in $remoteBranchesRaw) {
                $branchName = $remote -replace '^origin/', ''
                if ($branchName -ne "HEAD") {
                    $remoteBranches += $branchName
                }
            }

            foreach ($localBranch in $localBranches) {
                if (-not ($remoteBranches -contains $localBranch)) {
                    git branch -D $localBranch
                }
            }
        }
        else {
            $goneBranches = git for-each-ref --format '%(refname) %(upstream:track)' refs/heads |
            Where-Object { $_ -match '\[gone\]' } |
            ForEach-Object {
                    ($_ -split " ")[0] -replace "^refs/heads/", ""
            }

            foreach ($branch in $goneBranches) {
                git branch -D $branch
            }
        }
    }
}

Set-Location $originalLocation
