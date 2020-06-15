dism /online /cleanup-image /restorehealth && sfc /scannow

set /P exit_value="Exit? (Y/N): "
echo You entered: %exit_value%...