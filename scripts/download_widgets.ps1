$out = 'output'
if (-not (Test-Path $out)) { New-Item -ItemType Directory -Path $out | Out-Null }
$urls = @{
    'stats' = 'https://github-readme-stats.vercel.app/api?username=DeekshithKB&show_icons=true&hide_border=true&theme=dark&count_private=true&include_all_commits=true'
    'streak' = 'https://streak-stats.demolab.com/?user=DeekshithKB&theme=dark&hide_border=true'
    'toplangs' = 'https://github-readme-stats.vercel.app/api/top-langs/?username=DeekshithKB&layout=compact&theme=dark&hide_border=true&langs_count=8&count_private=true'
    'trophy' = 'https://github-profile-trophy.vercel.app/?username=DeekshithKB&theme=algolia&no-frame=true&no-bg=true&margin-w=8&column=7'
}

foreach ($k in $urls.Keys) {
    $u = $urls[$k]
    $file = Join-Path $out ($k + '.png')
    try {
        Invoke-WebRequest -Uri $u -UseBasicParsing -OutFile $file -TimeoutSec 30
        $size = (Get-Item $file).Length
        Write-Output "$k -> saved ($size bytes)"
    } catch {
        Write-Output "$k -> FAILED: $($_.Exception.Message)"
    }
}
