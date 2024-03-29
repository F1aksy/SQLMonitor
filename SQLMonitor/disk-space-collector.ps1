[CmdletBinding()]
Param (
    # Set SQL Server where data should be saved
    [Parameter(Mandatory=$false)]
    $SqlInstance = 'localhost',

    [Parameter(Mandatory=$false)]
    $Database = 'DBA',

    [Parameter(Mandatory=$false)]
    $HostName = $env:COMPUTERNAME,

    [Parameter(Mandatory=$false)]
    $TableName = '[dbo].[disk_space]'
)

$modulePath = [Environment]::GetEnvironmentVariable('PSModulePath')
$modulePath += ';C:\Program Files\WindowsPowerShell\Modules'
[Environment]::SetEnvironmentVariable('PSModulePath', $modulePath)

Import-Module dbatools

Write-Debug "Here at start of function."
$ErrorActionPreference = 'Stop'
$startTime = Get-Date
$startTimeUTC = $startTime.ToUniversalTime()

# Variable placeholders

"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Fetch disk space on `$HostName = [$HostName].."
$dbaDiskSpace = Get-DbaDiskSpace -ComputerName $HostName -Unit MB -EnableException

"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Push disk info to SqlServer [$SqlInstance].[$Database].$TableName.."
$dbaDiskSpace | Where-Object {-not [String]::IsNullOrEmpty($_.Capacity.Megabyte)} | Select-Object @{l='collection_time_utc';e={$startTimeUTC}}, @{l='host_name';e={$_.ComputerName}}, @{l='disk_volume';e={$_.Name}}, `
                    @{l='label';e={$label = $_.Label; if([String]::IsNullOrEmpty($label)){'Local Disk'}else{$label}}}, `
                    @{l='capacity_mb';e={$_.Capacity.Megabyte}}, @{l='free_mb';e={$_.Free.Megabyte}}, @{l='block_size';e={$_.BlockSize}}, `
                    @{l='filesystem';e={$_.FileSystem}} |
        Write-DbaDbTableData -SqlInstance $SqlInstance -Database $Database -Table $TableName -EnableException

"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Export completed in $((New-TimeSpan -Start $startTimeUTC -End (Get-Date).ToUniversalTime()).TotalSeconds) seconds."
