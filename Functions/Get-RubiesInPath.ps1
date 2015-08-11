function Get-RubiesInPath
{
  [array]$rubyPaths = (iex "where.exe ruby") |
    sort |
    % { New-Object "System.IO.FileInfo" $_ } |
    select -Expand Directory |
    select -Expand FullName

      return $rubyPaths
}
