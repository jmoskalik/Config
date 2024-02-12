SetxecutionPolicy Bypass -Scope Process -Force
$apps = @(
    "Microsoft.VisualStudio.Code"
    "Git.Git"
    "GitHub.GitHubDesktop.Beta"   
    "Python.Python.3.0"   
    "OpenJS.NodeJS"  
    "VMware.WorkstationPlayer"   
    "CPUID.HWMonitor"   
    "CPUID.CPU-Z"   
    "GIMP.GIMP"   
    "Prusa3D.PrusaSlicer"   
    "Rufus.Rufus"   
    "Valve.Steam"   
    "Discord.Discord"   
    "WhirlwindFX.SignalRgb"   
)

foreach ($app in $apps) {
    winget install --id $app
}

wsl --install Debian --set-default-version 2


