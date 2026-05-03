##
# STATE: Working- albeit with rough edges (in active developement)
# install_rsync.ps1
#
# Installs `rsync` using precompiled packages from [MSYS](https://repo.msys2.org/msys/x86_64/)
# This is a supplement to the OpenSSH-server on Windows
#
# @author Harald Hauknes <harald at hauknes dot org>
##

## Defaults ##
$installation_path = $HOME + "/.local" # Add <this>/usr/bin to PATH
$baseUrl = "https://repo.msys2.org/msys/x86_64/"
$temp_storage = "./temp_rsync_installation"
$filename_trail = "-x86_64.pkg.tar.zst"
#TODO: Find the latest version automagically
$rsync_dependencies = @(
    "rsync-3.4.1-1",
    "libzstd-1.5.7-1",
    "libxxhash-0.8.3-1"
  )
#
## Downloads ##
Write-Host -ForegroundColor DarkYellow "Creating temporary directory for downloads: '$temp_storage'"
New-Item -Path $temp_storage -ItemType Directory -ErrorAction SilentlyContinue | Out-Null
Write-Host "File downloads - Downloading all dependencies:"
foreach ($package_name in $rsync_dependencies) {
    $url = $baseUrl + $package_name + $filename_trail
    $dest = $temp_storage + '/' + $package_name + $filename_trail
    Write-Host -ForegroundColor DarkCyan "$package_name$filename_trail"
    #TODO: Don't download if file already exist
    Invoke-WebRequest -Uri $url -OutFile $dest
}
#
## Unarchiving ##
# TODO: Alternately check for 7-zip/Nanazip
$tar_capable = $(where.exe tar.exe)
if ( $tar_capable.Length -gt 5 ) {
  Write-Host "Un-packing downloaded tarballs:"
  foreach ($package_name in $rsync_dependencies) {
    $url = $baseUrl + $package_name + $filename_trail
    $dest = $temp_storage + '/' + $package_name + $filename_trail
    Write-Host -ForegroundColor DarkCyan "$package_name$filename_trail"
    $result = $(tar.exe -xf $dest -C $temp_storage)
    Write-Host $result
    }
  } else {
  Write-Host -ForegroundColor Red "WARNING: Could not find unarchiver for the downloaded files. You will need to manually unpack them and move them to the desired path."
}
# If not tar, then 7z
#$7zip_present = $(where.exe 7z.exe)
#Write-Host $7zip_present
# Also see: https://deepwiki.com/M2Team/NanaZip/1.2-getting-started
Write-Host -ForegroundColor DarkYellow "Create folder - Creating installation-path: '$installation_path'"
#
## Installation ##
New-Item -Path $installation_path -ItemType Directory -ErrorAction SilentlyContinue | Out-Null
Copy-item -Path "$temp_storage/usr" -Destination "$installation_path" -Recurse -ErrorAction SilentlyContinue
Write-Host -ForegroundColor DarkGreen "Done: For now you have to manually:"
Write-Host -ForegroundColor Red "- Check '$installation_path' for desired content."
Write-Host -ForegroundColor Red "- Remove '$temp_storage' used for downloading and unarchiving tarballs."
#
## Post-installation ##
#TODO: Optionally Add $installation_path/usr/bin to Path
#TODO: Clean up the temp-files IF this run actually created it, leave it as if if not

