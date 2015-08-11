<#
  .SYNOPSIS
  Displays the first ruby path variable in env:Path
#>
function Get-CurrentRuby {
  [Array] $rubiesInPath = Get-RubiesInPath

  if ($rubiesInPath.Length -gt 0) {
    return $rubiesInPath[0]
  }

  return ""
}
