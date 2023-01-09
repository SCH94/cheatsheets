function Add-Numbers
{
    #passing parameters
    param([int]$num1,[int]$num2)
    return $num1 + $num2
}

# creating a list
$results = @(Add-Numbers -num1 10 -num2 20)
#appending to list
$results += Add-Numbers -num1 5 -num2 20

Write-Host "$results"

# parameters, cmdlets, .NET functions
#function to get information about directory, subdirectory, total size, number of files etc

#attaching parameters directely to function
function Get-DirInfo([string]$dir)
{
    $result = Get-ChildItem $dir -Recurse | Measure-Object -Property length -sum   
    return [math]::Round(($result).sum/1GB,2)
}

Get-DirInfo -dir C:\playground\
