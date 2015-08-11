function Get-DefaultRuby(){
  [Environment]::GetEnvironmentVariable("PSUNDLE_RUBY_DEFAULT", "User")
}
