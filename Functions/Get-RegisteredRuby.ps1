<#
  .SYNOPSIS
  Returns the first registered ruby matching the supplied version

  .PARAMETER version
  Regular expression used to match a ruby version.
#>
function Get-RegisteredRuby(
  [Parameter(Mandatory=$true)][string]$version
){
  $regex = New-Object "System.Text.RegularExpressions.Regex" $version.Replace("\", "\\")
  [array]$rubyPaths = Get-RegisteredRubies | where { $regex.IsMatch($_) } | sort
  if ($rubyPaths.Count -eq 0)
  {
      throw "Could not find a version of ruby matching $version"
      iex "where.exe ruby"
      return
  }

  $rubyPath = $rubyPaths[0];
  return $rubyPath
}
