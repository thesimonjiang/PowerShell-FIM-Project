# Delete Baseline Function part for the Simpe FIM PowerShell Script
# Made by Simon Jiang. https://github.com/thesimonjiang

Function DeleteAlphaBaseIfExists () {
    $baselineExists = Test-Path -Path .\baseline-Alpha.txt

    if ($baselineExists) {
        Remove-Item -Path .\baseline-Alpha.txt
    }
}

Function DeleteBetaBaseIfExists () {
    $baselineExists = Test-Path -Path .\baseline-Beta.txt

    if ($baselineExists) {
        Remove-Item -Path .\baseline-Beta.txt
    }
}