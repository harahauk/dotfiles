##
# Prints all the links in a Word-document to the console.
# Usage: Get-DocumentLinks.ps1 <path to document>  
param(
    [Parameter(Mandatory=$true)]
    [string]$DocumentPath
)
Write-Output "Getting links from document: $DocumentPath"
$word = New-Object -ComObject Word.Application -ErrorAction Stop
$word.Visible = $false
try {
    $document = $word.Documents.Open($DocumentPath)
} catch {
    Write-Error "Failed to open document: $_"
    Write-Output "Often this is due to the document being open in another application. Please close the document and try again."
    $word.Quit()
    exit 1
}

$links = $document.Hyperlinks
foreach ($link in $links) {
    Write-Output $link.Address
}
$document.Close()
$word.Quit()
