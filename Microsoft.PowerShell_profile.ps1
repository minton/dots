function which($name)
{
    Get-Command $name | Select-Object -ExpandProperty Definition
}

pushd "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\Tools"
cmd /c "VsDevCmd.bat&set" |
foreach {
  if ($_ -match "=") {
    $v = $_.split("="); set-item -force -path "ENV:\$($v[0])"  -value "$($v[1])"
  }
}
popd

Set-Location C:\Dev\iddealsuite-v9

Write-Host "  __             
 / _) _/_   /    
/(_)(//(-(_/()(/ set-me-up
    /         /  v0.4" -ForegroundColor DarkMagenta
Import-Module posh-git
