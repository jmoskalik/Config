Set-ExecutionPolicy Bypass -Scope Process -Force &&
winget install --id=Microsoft.VisualStudioCode -e  &&
winget install --id=Git.Git -e  &&
winget install --id=GitHub.GitHubDesktop.Beta -e  &&
winget install --id=Python.Python.3.0 -e  &&
winget install --id=OpenJS.NodeJS -e &&
winget install --id=VMware.WorkstationPlayer -e  &&

winget install --id=CPUID.HWMonitor -e  &&
winget install --id=CPUID.CPU-Z -e  &&

winget install --id=GIMP.GIMP -e  &&

winget install --id=Prusa3D.PrusaSlicer -e  &&
winget install --id=Rufus.Rufus  -e &&

winget install --id=Valve.Steam -e  &&
winget install --id=Discord.Discord -e  &&

winget install --id=WhirlwindFX.SignalRgb -e  &&

wsl --install Debian --set-default-version 2


