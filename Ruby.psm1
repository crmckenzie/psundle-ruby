# Load all the functions in
$global:moduleRoot = split-path $MyInvocation.MyCommand.Path
$functionsDirectory = join-path $moduleRoot "Functions"
$filesToLoad = get-childitem $functionsDirectory *.ps1

foreach ($file in $filesToLoad)
{
    # Get the path
    $filePath = $file.FullName;

    # Load the file
    . "$filePath"
}

$defaultRuby = Get-DefaultRuby

if ([string]::IsNullOrEmpty($defaultRuby) -eq $false) {
  write-debug "Using default ruby: $defaultRuby"
  Use-Ruby $defaultRuby
}
