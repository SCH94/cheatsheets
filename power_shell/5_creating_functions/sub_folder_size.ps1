# find size of subfolders and files
$dataColl = @()
function Get-DirInfo([string]$dir)
{
    $results = Get-ChildItem $dir -ErrorAction SilentlyContinue | Where-Object {
        $_ -is [io.directoryInfo]
    } | ForEach-Object {
    $len = gci $_.FullName -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property length -sum
    $foldersize = $len.Sum
    $foldersizeGB = [math]::Round(($len).Sum/1GB,4)
    $fsizeGB = "{0} GB" -f $foldersizeGB
    $foldersizeMB = [math]::Round(($len).Sum/1MB,8)
    $fsizeMB = "{0} MB" -f $foldersizeMB
    $dataObject = New-Object PSObject
    Add-Member -inputObject $dataObject -memberType NoteProperty -name “foldername” -value $_.FullName;
    Add-Member -inputObject $dataObject -memberType NoteProperty -name “foldersizeBytes” -value $foldersize
    Add-Member -inputObject $dataObject -memberType NoteProperty -name “foldersizeGb” -value $fsizeGB
    Add-Member -inputObject $dataObject -memberType NoteProperty -name “foldersizeMb” -value $fsizeMB
    $dataColl += $dataObject
    }
    return $dataColl | Out-GridView -Title 'Size Of SubDirectories'
}

Get-DirInfo -dir C:\vagrantbox
