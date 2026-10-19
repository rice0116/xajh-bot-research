$ErrorActionPreference = 'Stop'
$ProjectRoot = Split-Path -Parent $PSScriptRoot
$Python = if (Get-Command python -ErrorAction SilentlyContinue) { 'python' } elseif (Get-Command py -ErrorAction SilentlyContinue) { 'py' } else { throw 'Python 3 was not found' }

& (Join-Path $PSScriptRoot 'build.ps1')
java -jar (Join-Path $ProjectRoot 'dist\xajh-login-probe.jar') --self-test
if ($LASTEXITCODE -ne 0) { throw 'self-test failed' }

& $Python (Join-Path $ProjectRoot 'tests\python\test_login_probe.py') java
if ($LASTEXITCODE -ne 0) { throw 'login integration test failed' }
& $Python (Join-Path $ProjectRoot 'tests\python\test_rolelist.py') java
if ($LASTEXITCODE -ne 0) { throw 'role/world integration test failed' }
& $Python (Join-Path $ProjectRoot 'tests\python\test_worldstate.py') java
if ($LASTEXITCODE -ne 0) { throw 'world replay test failed' }

Write-Host 'All tests passed.'
