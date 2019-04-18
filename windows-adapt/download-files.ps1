$url = "https://nodejs.org/dist/v10.15.3/node-v10.15.3-x86.msi"
$output = "$PSScriptRoot\node.msi"
$start_time = Get-Date

Invoke-WebRequest -Uri $url -OutFile $output

Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s) - electron"

$url = "https://www.7-zip.org/a/7z1900.exe"
$output = "$PSScriptRoot\7z.exe"
$start_time = Get-Date

Invoke-WebRequest -Uri $url -OutFile $output

Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s) - 7zip"
