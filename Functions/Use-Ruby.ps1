<#
  .SYNOPSIS
  Modifies the current shell to use the specified version or ruby.

  .PARAMETER version
  Regular expression used to match a ruby version.
#>
Function Use-Ruby(
    [Parameter(Mandatory=$true)][string]$version
)
{
    $rubyPath = Get-RegisteredRuby $version
    [System.Collections.ArrayList] $currentPaths = ($env:Path.Split(';') |
      % {New-Object "System.IO.DirectoryInfo" $_} |
      select -Expand FullName)

    if ($currentPaths.Contains($rubyPath)) {
        $currentPaths.Remove($rubyPath)
    }

    $currentPaths.Insert(0, $rubyPath)
    $newPath = [System.String]::Join(';', $currentPaths.ToArray())
    $env:Path = $newPath
}
