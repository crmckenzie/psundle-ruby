<#
  .SYNOPSIS
  Analyses the current ruby environment for potential problems.
#>
function Test-RubyEnvironment(){
  $rubyPath = (Get-Command ruby | Select -Expand Path)
  $gemPath  = (Get-Command gem | Select -Expand Path)

  $rubyFile = New-Object "System.IO.FileInfo" $rubyPath
  $gemFile  = New-Object "System.IO.FileInfo" $gemPath

  if ($rubyFile.Directory -ne $gemFile.Directory) {
    write-host "ruby.exe and gem are not colocated." -ForegroundColor Red
    write-host "ruby.exe: $rubyPath"
    write-host "gem:      $gemPath"
    write-host ""
    write-host "This may be due to a known issue in ruby 2.1.6 in which gem.bat is missing from the installation folder."
    write-host "If this is the case, consider copying gem.bat from another ruby installation."
  }
}
