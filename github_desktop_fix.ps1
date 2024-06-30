if ($env:Path -notlike "*C:\Program Files\Git\usr\bin*") {
    Write-Output "C:\Program Files\Git\usr\bin not in PATH"
    $env:Path = 'C:\Program Files\Git\usr\bin;' + $env:Path
    if ($env:Path -notlike "*C:\Program Files\Git\usr\bin*") {
        Write-Output "Failed to add C:\Program Files\Git\usr\bin to PATH"
    }
    else {
        Write-Output "Successfully added C:\Program Files\Git\usr\bin to PATH"
    }
}
else {
    Write-Output "C:\Program Files\Git\usr\bin already in PATH"
}
