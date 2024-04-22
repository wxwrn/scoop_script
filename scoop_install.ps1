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






$browsers = @(
    'firefox',
    'brave'
)

$programs = @(
    'vlc',
    'notepadplusplus',
    'bitwarden',
    'chocolateygui',
    'syncthingtray',
    'spotify',
    'vscode',
    'qbittorrent',
    'neovim',
    'steam',
    'bulk-crap-uninstaller',
    'naps2'

)

$tools = @(
    '7zip',
    'ripgrep',
    'powertoys',
    'syncthing',
    'powertoys',
    'git',
    'gh',
    'ventoy',
    'fd',
    'fzf',
    'everything',
    'lazygit',
    'hwinfo',
    'sophiapp',
    'wiztree',
    'f.lux',
    'kdeconnect-kde'

)

$fonts = @(
    'nerd-fonts-jetbrainsmono',
    'nerd-fonts-firacode'
)

$wingetPackages = @(
    'Vencord.Vesktop',
    'Helix.Helix',
    'Rem0o.FanControl'
)

function searchBrowsers {

    foreach ($browser in $browsers) {
        Write-Host $browser
        choco search -e $browser
    }
}


function searchTools {

    foreach ($tool in $tools) {
        Write-Host $tool
        choco search -e $tool
    }
}

function searchPrograms {

    foreach ($program in $programs) {
        Write-Host $program
        choco search -e $program
    }
}

function searchFonts {

    foreach ($font in $fonts) {
        Write-Host $font
        choco search -e $font
    }
    
}

function searchPackages {
    searchBrowsers
    searchTools
    searchPrograms
    searchFonts
}

function installPackages {
    choco install -y $fonts
    choco install -y $browsers
    choco install -y $tools
    choco install -y $programs
}

function installWingetPackages {

    winget install $wingetPackages
    
}

function writeoutGreen {
    param (
        [string]$text
    )

    Write-Host $text -ForegroundColor green
    
}

function menu {
    param (
        [string]$Title = "choco script"
    )
    Clear-Host
    Write-Host "================ $Title ================"
       
    Write-Host "1: List all packages"
    Write-Host "2: Check for availability of selected packages"
    Write-Host "3: Install packages"
    Write-Host "Q: Press 'Q' to quit."
}

scoop install main/aria2
    
do {
    menu
    $input = Read-Host "Please make a selection"
    switch ($input) {
        '1' {
            Clear-Host
           
            writeoutGreen 'You chose option #1'
            writeoutGreen 'Listing all packages'
            
            $fonts
            $browsers
            $programs
            $tools

        } '2' {
            Clear-Host

            writeoutGreen 'You chose option #2' 
            writeoutGreen 'Checking for availability of selected packages' 

            searchPackages

        } '3' {
            Clear-Host

            writeoutGreen 'You chose option #3' 
            writeoutGreen 'Installing packages' 

            installPackages
            installWingetPackages
            
        } 'q' {
            return
        }
    }
    pause
}
until ($input -eq 'q')

