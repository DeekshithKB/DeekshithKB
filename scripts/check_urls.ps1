$urls = @(
    'https://github-readme-stats-git-master-rstaa-rickstaa.vercel.app/api?username=DeekshithKB&show_icons=true&theme=tokyonight&hide_border=true&count_private=true&include_all_commits=true',
    'https://streak-stats.demolab.com/?user=DeekshithKB&theme=tokyonight&hide_border=true&ring=7C3AED&fire=8B5CF6&currStreakLabel=A78BFA',
    'https://github-readme-stats-git-master-rstaa-rickstaa.vercel.app/api/top-langs/?username=DeekshithKB&layout=compact&theme=tokyonight&hide_border=true&langs_count=8&count_private=true',
    'https://github-profile-trophy.vercel.app/?username=DeekshithKB&theme=tokyonight&no-frame=true&no-bg=true&margin-w=8&column=7',
    'https://raw.githubusercontent.com/DeekshithKB/DeekshithKB/output/github-contribution-grid-snake-dark.svg'
)

foreach ($u in $urls) {
    try {
        $req = [System.Net.WebRequest]::Create($u)
        $req.Method = 'HEAD'
        $res = $req.GetResponse()
        $code = $res.StatusCode.value__
        $res.Close()
        Write-Output "$u -> $code"
    }
    catch [System.Net.WebException] {
        $resp = $_.Exception.Response
        if ($resp -ne $null) {
            try { $code = $resp.StatusCode.value__ } catch { $code = 'ERR' }
            Write-Output "$u -> $code"
        } else {
            Write-Output "$u -> NO RESPONSE"
        }
    }
}
