# Delete Baseline Function part for the Simpe FIM PowerShell Script
# Made by Simon Jiang. https://github.com/thesimonjiang

# To make this script to work on your own system: you need to replace the directory paths 
# in this script with that of your own. Replace all the instances of "YOUR_OWN_SYSTEM_PATH"
# and your own baseline file name.

Function DeleteAlphaBaseIfExists () {
    $baselineExists = Test-Path -Path YOUR_OWN_SYSTEM_PATH\baseline-Alpha.txt

    if ($baselineExists) {
        Remove-Item -Path YOUR_OWN_SYSTEM_PATH\baseline-Alpha.txt
    }
}

Function DeleteBetaBaseIfExists () {
    $baselineExists = Test-Path -Path YOUR_OWN_SYSTEM_PATH\baseline-Beta.txt

    if ($baselineExists) {
        Remove-Item -Path YOUR_OWN_SYSTEM_PATH\baseline-Beta.txt
    }
}
