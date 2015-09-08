function Install-Ruby(
  [Parameter(Mandatory=$true)][string]$version,
  [bool] $64Bit = $true
)
{
    $x64 = ""
    if ($64Bit) {
    $x64 = "-x64"
    }

    $installerFileName = "rubyinstaller-$version$x64.exe"
    $url = "http://dl.bintray.com/oneclick/rubyinstaller/$installerFileName"


    function Get-DownloadDirectory(){
      return Join-Path $env:TEMP "ruby"
    }

    function Assert-DirectoryExists($dir){
      if ((Test-Path $dir) -eq $false)
      {
        write-debug "Creating directory $dir"
        mkdir $dir
      }
    }

    function Get-DownloadedInstallerPath(){
      return Join-Path (Get-DownloadDirectory) $installerFileName
    }

    function Get-InstallationDirectory(){
        $binRoot = "C:\bin"
        return Join-Path $binRoot "ruby-$version"
    }

    function Download-Ruby(){

      $installerFullPath = Get-DownloadedInstallerPath

      if ((Test-Path $installerFullPath) -eq $false){
          (New-Object System.Net.WebClient).DownloadFile($url, $installerFullPath)
      }

      return $installerFullPath
    }

    function Invoke-SilentInstaller($installerFullPath, $installationDirectory){
        $arguments = "/verysilent"
        $cmd = "Start-Process -file ""$installerFullPath"" -arg ""$arguments"" -RedirectStandardOutput $true -Wait"
        $cmd
        Invoke-Expression $cmd
    }

    try
    {
      $downloadDirectory = Get-DownloadDirectory
      Assert-DirectoryExists $downloadDirectory

      $installerFullPath = Download-Ruby
      $installationDirectory = Get-InstallationDirectory

      Invoke-SilentInstaller $installerFullPath $installationDirectory

    } catch {
        write-error $_
        throw
    }
}
