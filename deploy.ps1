$ErrorActionPreference = "Stop"
function New-OrigDestinationTuple
{
    param 
    (
        [Parameter(
            Mandatory = $true, 
            Position = 0,
            HelpMessage = "the original position of the file")]
        [ValidateNotNullOrEmpty()]
        [string]
        $origFile,

        [Parameter(
            Mandatory = $true,
            Position = 1,
            HelpMessage = "the symlink destination of the file")]
        [ValidateNotNullOrEmpty()]
        [string]
        $destination
    )
    
    return New-Object -TypeName psobject -Property @{
        origFile    = $origFile
        destination = $destination
    }
}

# update all the submodules
Write-Host "updating submodules" -ForegroundColor Yellow
Start-Process -FilePath "git" -ArgumentList "submodule update --remote --merge" -Wait -NoNewWindow
Write-Host "update finished" -ForegroundColor Yellow
Write-Host

# record information
$origDestinationList = @(
    # vim
    New-OrigDestinationTuple -destination "$HOME\.ideavimrc" -origFile "$PSScriptRoot\vim\idea_vim_config.vim"
    New-OrigDestinationTuple -destination "$HOME\_vsvimrc" -origFile "$PSScriptRoot\vim\vs_vim_config.vim"
    New-OrigDestinationTuple -destination "$HOME\vimfiles" -origFile "$PSScriptRoot\vim\vimfiles"

    # spacemacs
    New-OrigDestinationTuple -destination "$HOME\.spacemacs" -origFile "$PSScriptRoot\emacs\.spacemacs"
    New-OrigDestinationTuple -destination "$HOME\.emacs.d" -origFile "$PSScriptRoot\emacs\spacemacs"

    # editorconfig
    New-OrigDestinationTuple -destination "$HOME\.editorconfig" -origFile "$PSScriptRoot\editorconfig\.editorconfig"

) 

# deploy
foreach($origDestinationinTuple in $origDestinationList)
{
    $origFile = $origDestinationinTuple.origFile
    $destination = $origDestinationinTuple.destination
    New-Item -ItemType SymbolicLink -Path $destination -Value $origFile -Force | Out-Null
    Write-Host "symlink created in $destination" -ForegroundColor Yellow
} 