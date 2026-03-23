##
# STATE: Not working (in active developement)
# install_rsync.ps1
#
# Installs `rsync` using precompiled packages from [MSYS](https://repo.msys2.org/msys/x86_64/)
# @author Harald Hauknes <harald at hauknes dot org>
##

$installation_path = $HOME + "/.local"
$baseUrl = "https://repo.msys2.org/msys/x86_64/"
$temp_storage = "./rsync_install_temp"
$filename_trail = "-x86_64.pkg.tar.zst"
#TODO: Find the latest version automagically
$rsync_dependencies = @(
    "rsync-3.4.1-1",
    "libzstd-1.5.7-1",
    "libxxhash-0.8.3-1"
)

New-Item -Path $temp_storage -ItemType Directory -ErrorAction SilentlyContinue
foreach ($package_name in $rsync_dependencies) {
    $url = $baseUrl + $package_name + $filename_trail
    $dest = $temp_storage + '/' + $package_name + $filename_trail
    Invoke-WebRequest -Uri $url -OutFile $dest
    #TODO: Unzip package

}
New-Item -Path $installation_path -ItemType Directory -ErrorAction SilentlyContinue
#TODO: Copy the unpacked packages to the installation directory
#TODO: Optionally Add $installation_path/usr/bin to Path
#TODO: Clean up the temp-files

