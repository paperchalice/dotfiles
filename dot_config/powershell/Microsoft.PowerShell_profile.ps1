Import-Module 'C:\My_Libs\vcpkg\scripts\posh-vcpkg'
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Paradox


if ($IsWindows) {
  function Enter-DevShell {
    $Instance = &"${env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe" -latest -format json | ConvertFrom-Json

    Import-Module "$($Instance.installationPath)\Common7\Tools\Microsoft.VisualStudio.DevShell.dll"
    Enter-VsDevShell $Instance.instanceId -SkipAutomaticLocation -DevCmdArguments "-arch=x64 -host_arch=x64" # -no_logo
  }
}

