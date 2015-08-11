function Show-RubyEnvironment{

  $registeredRubies = Get-RegisteredRubies
  $defaultRuby = Get-DefaultRuby
  $currentRuby = Get-CurrentRuby

  write-host "CURRENT RUBY: $currentRuby"
  write-host "DEFAULT RUBY: $defaultRuby"
  write-host "REGISTERED RUBIES:"
  $registeredRubies | foreach {write-host $_}
}
