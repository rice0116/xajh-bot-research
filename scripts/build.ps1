$ErrorActionPreference = 'Stop'
$ProjectRoot = Split-Path -Parent $PSScriptRoot
$Classes = Join-Path $ProjectRoot 'build\classes'
$Source = Join-Path $ProjectRoot 'src\main\java\XajhLoginProbe.java'
$Jar = Join-Path $ProjectRoot 'dist\xajh-login-probe.jar'

New-Item -ItemType Directory -Force -Path $Classes,(Split-Path -Parent $Jar) | Out-Null
Remove-Item -Recurse -Force -LiteralPath $Classes
New-Item -ItemType Directory -Force -Path $Classes | Out-Null

javac -source 1.6 -target 1.6 -encoding UTF-8 -d $Classes $Source
if ($LASTEXITCODE -ne 0) { throw 'javac failed' }

jar cfe $Jar XajhLoginProbe -C $Classes .
if ($LASTEXITCODE -ne 0) { throw 'jar failed' }

Write-Host "Built $Jar"
