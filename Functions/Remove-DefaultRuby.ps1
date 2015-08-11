<#
  .SYNOPSIS
  Removes the default ruby selection.
#>
function Remove-DefaultRuby(){
  [Environment]::SetEnvironmentVariable("PSUNDLE_RUBY_DEFAULT", $null, "User")
}
