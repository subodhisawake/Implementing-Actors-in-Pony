function Measure-Script {
    $sw = [Diagnostics.Stopwatch]::StartNew()
    $process = Start-Process -FilePath ".\ponyworld.exe" -PassThru -NoNewWindow
    $process.WaitForExit()
    $sw.Stop()

    $processInfo = Get-Process -Id $process.Id -ErrorAction SilentlyContinue

    $result = [PSCustomObject]@{
        TotalSeconds = $sw.Elapsed.TotalSeconds
        TotalMilliseconds = $sw.Elapsed.TotalMilliseconds
        UserProcessorTime = if ($processInfo) { $processInfo.UserProcessorTime.TotalSeconds } else { 0 }
        PrivilegedProcessorTime = if ($processInfo) { $processInfo.PrivilegedProcessorTime.TotalSeconds } else { 0 }
    }
    return $result
}

$result = Measure-Script

Write-Host "Total Execution Time: $($result.TotalSeconds) seconds"
Write-Host "Total Execution Time: $($result.TotalMilliseconds) milliseconds"
Write-Host "User Time: $($result.UserProcessorTime) seconds"
Write-Host "System Time: $($result.PrivilegedProcessorTime) seconds"