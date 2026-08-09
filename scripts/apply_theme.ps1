<#
Apply Neumorphic Design System to an existing project folder.

Usage:
  .\apply_theme.ps1 -ProjectPath 'C:\path\to\project' [-DryRun]

What it does:
- Copies the files from ./design-system into the target project's `styles` folder (creates if missing).
- Searches for common global CSS files and injects `@import` lines for `tokens.css` and `neumorphic.css` if not already present.

Notes:
- This script modifies files in-place. Use `-DryRun` to preview actions.
- Designed for Windows PowerShell (compatible with PowerShell Core).
#>

param(
  [Parameter(Mandatory=$true)] [string] $ProjectPath,
  [switch] $DryRun
)

function Write-Action($msg){ if($DryRun){ Write-Host "[DRYRUN] $msg" -ForegroundColor Yellow } else { Write-Host $msg -ForegroundColor Cyan }}

if(-not (Test-Path $ProjectPath)){
  Write-Error "Project path not found: $ProjectPath"
  exit 1
}

$src = Join-Path -Path (Split-Path -Parent $MyInvocation.MyCommand.Definition) -ChildPath "..\design-system"
$destStyles = Join-Path -Path $ProjectPath -ChildPath "src\styles"

Write-Action "Source: $src"
Write-Action "Destination styles folder: $destStyles"

if(-not $DryRun){ New-Item -ItemType Directory -Path $destStyles -Force | Out-Null }

$filesToCopy = @("tokens.css","neumorphic.css")
foreach($f in $filesToCopy){
  $s = Join-Path $src $f
  $d = Join-Path $destStyles $f
  if(Test-Path $s){
    Write-Action "Copying $f -> $d"
    if(-not $DryRun){ Copy-Item -Path $s -Destination $d -Force }
  } else { Write-Host "Source file missing: $s" -ForegroundColor Red }
}

# Try to find global CSS entries to inject imports
$candidates = @("index.css","App.css","global.css","styles.css")
$injected = $false
foreach($c in $candidates){
  $paths = Get-ChildItem -Path $ProjectPath -Recurse -Include $c -ErrorAction SilentlyContinue | Select-Object -First 5
  foreach($p in $paths){
    $text = Get-Content $p.FullName -Raw
    if($text -notmatch "tokens\.css"){ 
      $importLines = "@import './src/styles/tokens.css';`n@import './src/styles/neumorphic.css';`n"
      Write-Action "Injecting imports into $($p.FullName)"
      if(-not $DryRun){ Set-Content -Path $p.FullName -Value ($importLines + $text) -Force }
      $injected = $true
    } else {
      Write-Host "Already imported in $($p.FullName)" -ForegroundColor DarkGreen
    }
  }
}

if(-not $injected){ Write-Action "No global CSS files found or imports already present. You may need to import tokens.css and neumorphic.css manually." }

Write-Action "Done. If you want, run your project's dev server to review styles."
