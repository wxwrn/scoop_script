. .\modules\buckets.ps1
. .\modules\apps.ps1
. .\modules\functions.ps1

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




# !!!!!!!!!!!!!!!!!! VERY IMPORTANTE!!!!!!!
scoop install main/git
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