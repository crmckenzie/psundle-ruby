function Remove-DefaultRuby(){
  [Environment]::SetEnvironmentVariable("PSUNDLE_RUBY_DEFAULT", $null, "User")
}
