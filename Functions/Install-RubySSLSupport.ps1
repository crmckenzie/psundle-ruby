<#
  .SYNOPSIS
  Downloads the latest cacert.pem file and sets the appropriate environment
  variable so that Ruby can find it.

  .Description
  You'll need this when you get the dreaded ssl_cert errors while connecting
  to https sites.
  
#>
function Install-RubySSLSupport()
{
  try
  {
    $outputDir = $env:UserProfile
    $outputFile = Join-Path $outputDir "cacert.pem"
    $cmd = "curl http://curl.haxx.se/ca/cacert.pem -o ""$outputFile"""
    $cmds
    Invoke-Expression $cmd

    [Environment]::SetEnvironmentVariable("SSL_CERT_FILE", $outputFile, "User")
    $env:SSL_CERT_FILE = $outputFile
    write-host "environment variable SSL_CERT_FILE set to $outputFile"
    write-host "You may need to restart your shell for the changes to take effect."
  }
  catch {
    "Install-RubySSLSupport failed: $_"
  }
}
