function Register-Ruby([Parameter(Mandatory=$true)][string]$path)
{
  [Array] $paths = Get-RegisteredRubies

  $newDir = New-Object "System.IO.DirectoryInfo" $path
  if ($newDir.Exists -ne $true) {
    throw "$newDir is not an existing directory."
    return
  }

  $arrayList = New-Object "System.Collections.ArrayList"
  $arrayList.AddRange($paths)
  if ($arrayList.Contains($newDir.FullName) -eq $false) {
    $arrayList.Add($newDir.FullName)
  }

  $newPaths = [System.String]::Join(';', $arrayList.ToArray())
  [Environment]::SetEnvironmentVariable("PSUNDLE_RUBY_PATHS", $newPaths, "User")
  return
}
