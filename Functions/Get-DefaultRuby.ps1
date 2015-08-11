<#
  .SYNOPSIS
  Displays the default ruby path.
#>
function Get-DefaultRuby(){
  [Environment]::GetEnvironmentVariable("PSUNDLE_RUBY_DEFAULT", "User")
}
