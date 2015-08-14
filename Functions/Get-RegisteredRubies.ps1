<#
  .SYNOPSIS
  Displays the list of registered rubies.
#>
function Get-RegisteredRubies
{
  [string] $memo = [Environment]::GetEnvironmentVariable("PSUNDLE_RUBY_PATHS", "User")
  if ([string]::IsNullOrEmpty($memo)){
    return New-Object "System.Collections.ArrayList"
  }

  [Array] $paths = $memo.Split(';') |
    % { New-Object "System.IO.DirectoryInfo" $_ } |
    select -Expand FullName

  return $paths
}
