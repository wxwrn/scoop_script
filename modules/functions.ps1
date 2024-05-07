. .\modules\apps.ps1
. .\modules\buckets.ps1

function addBuckets {
    foreach ($bucket in $scoopBuckets) {
        scoop bucket add $bucket
    }
}
function installMain {
    scoop install $mainBucket
}

function installExtras {
    scoop install $extrasBucket
}

function installGames {
    scoop install $gamesBucket
}

function installNerdFonts {
    scoop install $nerdFontsBucket
}


function listBuckets {
    $scoopBuckets 
}
function listPackages {
    $mainBucket
    $extrasBucket
    $gamesBucket
    $nerd_fontsBucket
}

function installPackages {
    installMain
    installExtras
    installGames
    installNerdFonts
}


function writeoutGreen {
    param (
        [string]$text
    )

    Write-Host $text -ForegroundColor green
    
}