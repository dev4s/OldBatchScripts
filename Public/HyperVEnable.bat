@ECHO OFF
PowerShell -Command "Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V –All"
pause