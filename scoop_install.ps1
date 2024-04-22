# for scoop.sh download aria2 package for multi-connection downloads
# scoop install aria2


$scoopBuckets = @(
    'extras',
    'games',
    'nerd-fonts'
)

function addBuckets {
    foreach ($bucket in $scoopBuckets) {
        scoop bucket add $bucket
    }
}

$mainBucket = @(
    'main/7zip',
    'main/neovim',
    'main/ripgrep',
    'main/git',
    'main/gh',
    'main/fd',
    'main/fzf',
    'main/helix'
)

$extrasBucket = @(
    'extras/firefox',
    'extras/brave',
    'extras/vlc',
    'extras/notepadplusplus',
    'extras/bitwarden',
    'extras/syncthingtray',
    'extras/spotify',
    'extras/vscode',
    'extras/qbittorrent',
    'extras/bulk-crap-uninstaller',
    'extras/naps2',
    'extras/powertoys',
    'extras/ventoy',
    'extras/everything',
    'extras/lazygit',
    'extras/hwinfo',
    'extras/sophiapp',
    'extras/wiztree',
    'extras/f.lux',
    'extras/kdeconnect',
    'extras/vesktop',
    'extras/fancontrol'
)

$gamesBucket = @(
    'games/steam'
)

$nerdFontsBucket = @(
    'nerd-fonts/JetBrainsMono-NF',
    'nerd-fonts/FiraCode-NF'
)

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

$pkgNum = $mainBucket.Count + $extrasBucket.Count + $gamesBucket.Count + $nerd_fontsBucket.Count

function menu {
    param (
        [string]$Title = "scoop script"
    )
    Clear-Host
    Write-Host "================ $Title ================"
    
    Write-Host "Number of packages:" $pkgNum 
    Write-Host "1: List all packages"
    Write-Host "2: Install packages"
    Write-Host "Q: Press 'Q' to quit."
}




# !!!!!!!!!!!!!!!!!!
addBuckets
scoop install main/aria2



    
do {
    menu
    $input = Read-Host "Please make a selection"
    switch ($input) {
        '1' {
            Clear-Host
           
            writeoutGreen 'You chose option #1'
            writeoutGreen 'Listing all packages'

            listPackages


        } '2' {
            Clear-Host

            writeoutGreen 'You chose option #2' 
            writeoutGreen 'Installing packages' 

            installPackages

            
        } 'q' {
            return
        }
    }
    pause
}
until ($input -eq 'q')