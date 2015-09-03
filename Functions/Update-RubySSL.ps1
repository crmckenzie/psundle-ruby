<#
  .SYNOPSIS
  Downloads the latest cacert.pem

  .PARAMETER version
  Regular expression used to match a ruby version.
#>
function Update-RubySSL(
  [string]$outputDir = $null)
{
  if ([string]::IsNullOrWhiteSpace($outputDir)){
    $outputDir = $env:UserProfile
  }

  if (Test-Path $outputDir)
  {
    $outputFile = Join-Path $outputDir "cacert.pem"
    $cmd = "curl http://curl.haxx.se/ca/cacert.pem -o ""$outputFile"""
    $cmd
    iex $cmd

    write-host "If you wish to set the cert file as the default for your system run:"
    write-host "Set-RubySSL ""$outputFile"""
  }
  else
  {
    throw "$outputDir does not exist."
  }
}
