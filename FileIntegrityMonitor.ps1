# Simpe File Integrity Monitor PowerShell Script
# Made by Simon Jiang. https://github.com/thesimonjiang

# To make this script to work on your own system: you need to replace the directory paths 
# in this script with that of your own. Replace all the instances of "YOUR_OWN_SYSTEM_PATH".

. YOUR_OWN_SYSTEM_PATH\EmailNotification.ps1
. YOUR_OWN_SYSTEM_PATH\DeleteBaseline.ps1

Function CalcFileHash($filepath) {
    $filehash = Get-FileHash -Path $filepath -Algorithm SHA256
    return $filehash
}

# Ask user to choose a folder to monitor

Write-Host ""
Write-Host "Which directory would you like to monitor?"
Write-Host "    1) Alpha Folder"
Write-Host "    2) Beta Folder"
Write-Host ""
$responseFolder = Read-Host -Prompt "Please select '1' or '2'"
Write-Host ""

# If user chooses Alpha Folder

if ($responseFolder -eq "1") {
    Write-Host "Directory set to [Alpha] Folder" -ForegroundColor Green
    Write-Host ""
    Write-Host "What would you like to do?"
    Write-Host ""
    Write-Host "    1) Start a New Baseline"
    Write-Host "    2) Begin monitoring Files with Existing Baseline"
    Write-Host ""
    $responseAlpha = Read-Host -Prompt "Please select '1' or '2'"
    Write-Host ""
    Write-Host "You've selected $($responseAlpha))"
    Write-Host ""

    if ($responseAlpha -eq "1") {
        #Delete baseline.txt if it already exists
        DeleteAlphaBaseIfExists
    
        # Calculate Hash from the target files and store them in baseline-Alpha.txt
        Write-Host "Calculating SHA-256 HASH... New baseline for [Alpha] folder created" -ForegroundColor Green

        # Collect all the files in the targer folder
        $files = Get-ChildItem -Path YOUR_OWN_SYSTEM_PATH\Alpha

        # For each file, calculate the hash, and write to the baseline-Alpha.txt
        foreach ($item in $files) {
            $hash = CalcFileHash $item.FullName
            "$($hash.Path)|$($hash.Hash)" | Out-File -FilePath YOUR_OWN_SYSTEM_PATH\baseline-Alpha.txt -Append
        }
    }

    elseif ($responseAlpha -eq "2") {
        # Create a file-hash dictionary
        $fileHashDictionary = @{}

        # Load file-Hash pair from baseline.txt and store them in the dictionary
        $filePathHashPair = Get-Content -Path YOUR_OWN_SYSTEM_PATH\baseline-Alpha.txt

        foreach ($item in $filePathHashPair) {
            $fileHashDictionary.Add($item.Split("|")[0],$item.Split("|")[1])
        }

        # Begin the file monitoring session using existing baseline-Alpha.txt
        Write-Host "Loading existing baseline for [Alpha] folder... Starting file monitor..." -ForegroundColor Green
        Write-Host ""
        Write-Host "File monitor session has started" -ForegroundColor Green
        Write-Host ""

        while ($true) {
            Start-Sleep -Seconds 10
        
            $files = Get-ChildItem -Path YOUR_OWN_SYSTEM_PATH\Alpha

            # For each file, calculate the hash, and write to the baseline-Alpha.txt
            foreach ($item in $files) {
                $hash = CalcFileHash $item.FullName
            
                #Notify if a new file has been created
                if ($fileHashDictionary[$hash.Path] -eq $null) {
                    Write-Host "$($hash.Path) has been created!" -ForegroundColor Cyan
                    Write-Host "Admin has been notified by email!" -ForegroundColor Cyan
                    Write-Host ""
                    EmailNotificationAlphaAdd
                }

                else {
                    # Notify if a file has been altered
                    if ($fileHashDictionary[$hash.Path] -eq $hash.Hash) {
                    # Everything is the same
                    }             
                    else{
                        # A file has been altered
                        Write-Host "$($hash.Path) has been altered!" -ForegroundColor Yellow
                        Write-Host "Admin has been notified by email!" -ForegroundColor Yellow
                        Write-Host ""
                        EmailNotificationAlphaAltered
                    }
                }
            }

            # Notify if a file has been deleted
            foreach ($key in $fileHashDictionary.Keys) {
                $baselineAlphaFileStillExists = Test-Path -Path $key
                if (-Not $baselineAlphaFileStillExists) {
                    Write-Host "$($key) has been deleted!" -ForegroundColor Red
                    Write-Host "Admin has been notified by email!" -ForegroundColor Red
                    Write-Host ""
                    EmailNotificationAlphaDeleted
                }
            }
        }
    }

}

#If user chooses Beta Folder

elseif ($responseFolder -eq "2") {
    Write-Host "Directory set to [Beta] Folder" -ForegroundColor Green
    Write-Host ""
    Write-Host "What would you like to do?"
    Write-Host ""
    Write-Host "    1) Start a New Baseline"
    Write-Host "    2) Begin monitoring Files with Existing Baseline"
    Write-Host ""
    $responseBeta = Read-Host -Prompt "Please select '1' or '2'"
    Write-Host ""
    Write-Host "You've selected $($responseBeta))"
    Write-Host ""

    if ($responseBeta -eq "1") {
        #Delete baseline.txt if it already exists
        DeleteBetaBaseIfExists
    
        # Calculate Hash from the target files and store them in baseline-Beta.txt
        Write-Host "Calculating SHA-256 HASH... New baseline for [Beta] folder created" -ForegroundColor Green

        # Collect all the files in the targer folder
        $files = Get-ChildItem -Path YOUR_OWN_SYSTEM_PATH\Beta

        # For each file, calculate the hash, and write to the baseline-Beta.txt
        foreach ($item in $files) {
            $hash = CalcFileHash $item.FullName
            "$($hash.Path)|$($hash.Hash)" | Out-File -FilePath YOUR_OWN_SYSTEM_PATH\baseline-Beta.txt -Append
        }
    }

    elseif ($responseBeta -eq "2") {
        # Create a file-hash dictionary
        $fileHashDictionary = @{}

        # Load file-Hash pair from baseline.txt and store them in the dictionary
        $filePathHashPair = Get-Content -Path YOUR_OWN_SYSTEM_PATH\baseline-Beta.txt

        foreach ($item in $filePathHashPair) {
            $fileHashDictionary.Add($item.Split("|")[0],$item.Split("|")[1])
        }

        # Begin the file monitoring session using existing baseline-Beta.txt
        Write-Host "Loading existing baseline for [Beta] folder... Starting file monitor..." -ForegroundColor Green
        Write-Host ""
        Write-Host "File monitor session has started" -ForegroundColor Green
        Write-Host ""

        while ($true) {
            #How often the script will check the file hash in seconds. [10] means check against the baseline every 10 seconds.
            Start-Sleep -Seconds 10
        
            $files = Get-ChildItem -Path YOUR_OWN_SYSTEM_PATH\Beta

            # For each file, calculate the hash, and write to the baseline-Beta.txt
            foreach ($item in $files) {
                $hash = CalcFileHash $item.FullName
            
                #Notify if a new file has been created
                if ($fileHashDictionary[$hash.Path] -eq $null) {
                    Write-Host "$($hash.Path) has been created!" -ForegroundColor Cyan
                    Write-Host "Admin has been notified by email!" -ForegroundColor Cyan
                    Write-Host ""
                    EmailNotificationBetaAdd
                }

                else {
                    # Notify if a file has been altered
                    if ($fileHashDictionary[$hash.Path] -eq $hash.Hash) {
                        # Everything is the same
                    }
                                 
                    else{
                        # A file has been altered
                        Write-Host "$($hash.Path) has been altered!" -ForegroundColor Yellow
                        Write-Host "Admin has been notified by email!" -ForegroundColor Yellow
                        Write-Host ""
                        EmailNotificationBetaAltered
                    }
                }
            }

            # Notify if a file has been deleted
            foreach ($key in $fileHashDictionary.Keys) {
                $baselineBetaFileStillExists = Test-Path -Path $key
                if (-Not $baselineBetaFileStillExists) {
                    Write-Host "$($key) has been deleted!" -ForegroundColor Red
                    Write-Host "Admin has been notified by email!" -ForegroundColor Red
                    Write-Host ""
                    EmailNotificationBetaDeleted
                }
            }
        }
    }
}