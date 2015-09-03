function Set-RubySSL(
  [parameter(Mandatory=$true)][string]$filename
)
{
    if (Test-Path $filename){
      [Environment]::SetEnvironmentVariable("SSL_CERT_FILE", $filename, "User")
    }
    else
    {
      throw "No cert file found at '$filename'."
    }
}
