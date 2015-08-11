function Remove-Ruby([Parameter(Mandatory=$true)][string]$path)
{
  [Array] $paths = Get-RegisteredRubies

  $newDir = New-Object "System.IO.DirectoryInfo" $path
  $arrayList = New-Object "System.Collections.ArrayList"
  $arrayList.AddRange($paths)
  if ($arrayList.Contains($newDir.FullName) -eq $true) {
    $arrayList.Remove($newDir.FullName)
  }

  $newPaths = [System.String]::Join(';', $arrayList.ToArray())
  write-debug "Setting USER:PSUNDLE_RUBY_PATHS = $newPaths"
  [Environment]::SetEnvironmentVariable("PSUNDLE_RUBY_PATHS", $newPaths, "User")
  return
}
