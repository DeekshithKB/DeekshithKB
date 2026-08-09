$tests = @(
    'https://github-readme-stats.vercel.app/api?username=DeekshithKB&show_icons=true&theme=dark',
    'https://github-readme-stats.vercel.app/api/top-langs/?username=DeekshithKB&layout=compact&theme=dark',
    'https://github-profile-trophy.vercel.app/?username=DeekshithKB'
)

foreach ($u in $tests) {
    try {
        $r = [System.Net.WebRequest]::Create($u)
        $r.Method = 'HEAD'
        $res = $r.GetResponse()
        Write-Output "$u -> $($res.StatusCode.value__)"
        $res.Close()
    } catch [System.Net.WebException] {
        $resp = $_.Exception.Response
        if ($resp -ne $null) { Write-Output "$u -> $($resp.StatusCode.value__)" } else { Write-Output "$u -> NO RESPONSE" }
    }
}
