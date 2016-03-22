@ECHO OFF
PowerShell -Command "Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All"
pause