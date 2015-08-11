<#
  .SYNOPSIS
  Sets a particular ruby as the default. This version of ruby is set
  automatically when the module loads.

  .PARAMETER version
  Regular expression used to match a ruby version.
#>
function Set-DefaultRuby (
  [Parameter(Mandatory=$true)][string]$version
)
{
  $path = Get-RegisteredRuby $version
  [Environment]::SetEnvironmentVariable("PSUNDLE_RUBY_DEFAULT", $path, "User")
}
