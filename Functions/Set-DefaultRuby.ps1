function Set-DefaultRuby (
  [Parameter(Mandatory=$true)][string]$version
)
{
  $path = Get-RegisteredRuby $version
  [Environment]::SetEnvironmentVariable("PSUNDLE_RUBY_DEFAULT", $path, "User")
}
