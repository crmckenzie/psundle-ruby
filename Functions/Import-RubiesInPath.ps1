<#
  .SYNOPSIS
  Detects rubies in $env:Path and registers them with the module.
#>
function Import-RubiesInPath(){
  Get-RubiesInPath | foreach {
    Register-Ruby $_
  }
}
