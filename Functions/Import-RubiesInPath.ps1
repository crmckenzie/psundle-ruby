function Import-RubiesInPath(){
  Get-RubiesInPath | foreach {
    Register-Ruby $_
  }
}
