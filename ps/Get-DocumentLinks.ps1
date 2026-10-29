##
# Prints all the links in a document to the console.
# Usage: Get-DocumentLinks.ps1 <path to document>  
param(
    [Parameter(Mandatory=$true)]
    [string]$DocumentPath
)
$word = New-Object -ComObject Word.Application
$word.Visible = $false
$document = $word.Documents.Open($DocumentPath)
$links = $document.Hyperlinks
foreach ($link in $links) {
    Write-Output $link.Address
}
$document.Close()
$word.Quit()
