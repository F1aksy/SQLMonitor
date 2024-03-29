﻿[CmdletBinding()]
Param (
    [Parameter(Mandatory=$true)]
    [String]$SqlInstanceToBaseline,

    [Parameter(Mandatory=$false)]
    [String]$DbaDatabase = 'DBA',

    [Parameter(Mandatory=$false)]
    [String]$SqlInstanceAsDataDestination,

    [Parameter(Mandatory=$false)]
    [String]$SqlInstanceForTsqlJobs,

    [Parameter(Mandatory=$false)]
    [String]$SqlInstanceForPowershellJobs,

    [Parameter(Mandatory=$true)]
    [String]$InventoryServer,

    [Parameter(Mandatory=$false)]
    [String]$InventoryDatabase = 'DBA',

    [Parameter(Mandatory=$false)]
    [String]$HostName,

    [Parameter(Mandatory=$false)]
    [String]$SQLMonitorPath,

    [Parameter(Mandatory=$true)]
    [String]$DbaToolsFolderPath,

    [Parameter(Mandatory=$false)]
    [String]$FirstResponderKitZipFile,

    [Parameter(Mandatory=$false)]
    [String]$DarlingDataZipFile,

    [Parameter(Mandatory=$false)]
    [String]$OlaHallengrenSolutionZipFile,

    [Parameter(Mandatory=$false)]
    [String]$RemoteSQLMonitorPath = 'C:\SQLMonitor',

    [Parameter(Mandatory=$false)]
    [String]$MailProfileFileName = "DatabaseMail_Using_GMail.sql",

    [Parameter(Mandatory=$false)]
    [String]$WhoIsActiveFileName = "SCH-sp_WhoIsActive_v12_00(Modified).sql",

    [Parameter(Mandatory=$false)]
    [String]$AllDatabaseObjectsFileName = "SCH-Create-All-Objects.sql",

    [Parameter(Mandatory=$false)]
    [String]$XEventSessionFileName = "SCH-Create-XEvents.sql",

    [Parameter(Mandatory=$false)]
    [String]$WhatIsRunningFileName = "SCH-sp_WhatIsRunning.sql",

    [Parameter(Mandatory=$false)]
    [String]$UspGetAllServerInfoFileName = "SCH-usp_GetAllServerInfo.sql",

    [Parameter(Mandatory=$false)]
    [String]$UspWrapperGetAllServerInfoFileName = "SCH-usp_wrapper_GetAllServerInfo.sql",

    [Parameter(Mandatory=$false)]
    [String]$UspCollectWaitStatsFileName = "SCH-usp_collect_wait_stats.sql",

    [Parameter(Mandatory=$false)]
    [String]$UspCollectFileIOStatsFileName = "SCH-usp_collect_file_io_stats.sql",

    [Parameter(Mandatory=$false)]
    [String]$UspCollectXeventsResourceConsumptionFileName = "SCH-usp_collect_xevents_resource_consumption.sql",

    [Parameter(Mandatory=$false)]
    [String]$UspPartitionMaintenanceFileName = "SCH-usp_partition_maintenance.sql",

    [Parameter(Mandatory=$false)]
    [String]$UspPurgeTablesFileName = "SCH-usp_purge_tables.sql",

    [Parameter(Mandatory=$false)]
    [String]$UspRunWhoIsActiveFileName = "SCH-usp_run_WhoIsActive.sql",

    [Parameter(Mandatory=$false)]
    [String]$UspActiveRequestsCountFileName = "SCH-usp_active_requests_count.sql",

    [Parameter(Mandatory=$false)]
    [String]$UspWaitsPerCorePerMinuteFileName = "SCH-usp_waits_per_core_per_minute.sql",

    [Parameter(Mandatory=$false)]
    [String]$UspEnablePageCompressionFileName = "SCH-usp_enable_page_compression.sql",

    [Parameter(Mandatory=$false)]
    [String]$UspCollectMemoryClerksFileName = "SCH-usp_collect_memory_clerks.sql",

    [Parameter(Mandatory=$false)]
    [String]$UspCheckSQLAgentJobsFileName = "SCH-usp_check_sql_agent_jobs.sql",

    [Parameter(Mandatory=$false)]
    [String]$WhoIsActivePartitionFileName = "SCH-WhoIsActive-Partitioning.sql",

    [Parameter(Mandatory=$false)]
    [String]$BlitzIndexPartitionFileName = "SCH-BlitzIndex-Partitioning.sql",

    [Parameter(Mandatory=$false)]
    [String]$GrafanaLoginFileName = "grafana-login.sql",

    [Parameter(Mandatory=$false)]
    [String]$CheckInstanceAvailabilityJobFileName = "SCH-Job-[(dba) Check-InstanceAvailability].sql",

    [Parameter(Mandatory=$false)]
    [String]$CollectDiskSpaceJobFileName = "SCH-Job-[(dba) Collect-DiskSpace].sql",

    [Parameter(Mandatory=$false)]
    [String]$CollectOSProcessesJobFileName = "SCH-Job-[(dba) Collect-OSProcesses].sql",

    [Parameter(Mandatory=$false)]
    [String]$CollectPerfmonDataJobFileName = "SCH-Job-[(dba) Collect-PerfmonData].sql",

    [Parameter(Mandatory=$false)]
    [String]$CollectWaitStatsJobFileName = "SCH-Job-[(dba) Collect-WaitStats].sql",

    [Parameter(Mandatory=$false)]
    [String]$CollectFileIOStatsJobFileName = "SCH-Job-[(dba) Collect-FileIOStats].sql",

    [Parameter(Mandatory=$false)]
    [String]$CollectXEventsJobFileName = "SCH-Job-[(dba) Collect-XEvents].sql",

    [Parameter(Mandatory=$false)]
    [String]$PartitionsMaintenanceJobFileName = "SCH-Job-[(dba) Partitions-Maintenance].sql",

    [Parameter(Mandatory=$false)]
    [String]$PurgeTablesJobFileName = "SCH-Job-[(dba) Purge-Tables].sql",

    [Parameter(Mandatory=$false)]
    [String]$RemoveXEventFilesJobFileName = "SCH-Job-[(dba) Remove-XEventFiles].sql",

    [Parameter(Mandatory=$false)]
    [String]$RunWhoIsActiveJobFileName = "SCH-Job-[(dba) Run-WhoIsActive].sql",

    [Parameter(Mandatory=$false)]
    [String]$UpdateSqlServerVersionsJobFileName = "SCH-Job-[(dba) Update-SqlServerVersions].sql",

    [Parameter(Mandatory=$false)]
    [String]$GetAllServerInfoJobFileName = "SCH-Job-[(dba) Get-AllServerInfo].sql",

    [Parameter(Mandatory=$false)]
    [String]$InventorySpecificObjectsFileName = "SCH-Create-Inventory-Specific-Objects.sql",

    [Parameter(Mandatory=$false)]
    [String]$LinkedServerOnInventoryFileName = "SCH-Linked-Servers-Sample.sql",

    [Parameter(Mandatory=$false)]
    [String]$TestWindowsAdminAccessJobFileName = "SCH-Job-[(dba) Test-WindowsAdminAccess].sql",

    [Parameter(Mandatory=$false)]
    [String]$RunBlitzIndexJobFileName = "SCH-Job-[(dba) Run-BlitzIndex].sql",

    [Parameter(Mandatory=$false)]
    [String]$RunBlitzIndexWeeklyJobFileName = "SCH-Job-[(dba) Run-BlitzIndex - Weekly].sql",

    [Parameter(Mandatory=$false)]
    [String]$CollectMemoryClerksJobFileName = "SCH-Job-[(dba) Collect-MemoryClerks].sql",    

    [Parameter(Mandatory=$false)]
    [String]$CheckSQLAgentJobsJobFileName = "SCH-Job-[(dba) Check-SQLAgentJobs].sql",

    [Parameter(Mandatory=$false)]
    [String[]]$DbaGroupMailId,

    [Parameter(Mandatory=$false)]
    [ValidateSet("1__sp_WhoIsActive", "2__AllDatabaseObjects", "3__XEventSession",
                "4__FirstResponderKitObjects", "5__DarlingDataObjects", "6__OlaHallengrenSolutionObjects",
                "7__sp_WhatIsRunning", "8__usp_GetAllServerInfo", "9__CopyDbaToolsModule2Host",
                "10__CopyPerfmonFolder2Host", "11__SetupPerfmonDataCollector", "12__CreateCredentialProxy",
                "13__CreateJobCollectDiskSpace", "14__CreateJobCollectOSProcesses", "15__CreateJobCollectPerfmonData",
                "16__CreateJobCollectWaitStats", "17__CreateJobCollectXEvents", "18__CreateJobCollectFileIOStats",
                "19__CreateJobPartitionsMaintenance", "20__CreateJobPurgeTables", "21__CreateJobRemoveXEventFiles",
                "22__CreateJobRunWhoIsActive", "23__CreateJobRunBlitzIndex", "24__CreateJobRunBlitzIndexWeekly",
                "25__CreateJobCollectMemoryClerks", "26__CreateJobCheckSQLAgentJobs", "27__CreateJobUpdateSqlServerVersions",
                "28__CreateJobCheckInstanceAvailability", "29__CreateJobGetAllServerInfo", "30__WhoIsActivePartition",
                "31__BlitzIndexPartition", "32__EnablePageCompression", "33__GrafanaLogin",
                "34__LinkedServerOnInventory", "35__LinkedServerForDataDestinationInstance", "36__AlterViewsForDataDestinationInstance")]
    [String]$StartAtStep = "1__sp_WhoIsActive",

    [Parameter(Mandatory=$false)]
    [ValidateSet("1__sp_WhoIsActive", "2__AllDatabaseObjects", "3__XEventSession",
                "4__FirstResponderKitObjects", "5__DarlingDataObjects", "6__OlaHallengrenSolutionObjects",
                "7__sp_WhatIsRunning", "8__usp_GetAllServerInfo", "9__CopyDbaToolsModule2Host",
                "10__CopyPerfmonFolder2Host", "11__SetupPerfmonDataCollector", "12__CreateCredentialProxy",
                "13__CreateJobCollectDiskSpace", "14__CreateJobCollectOSProcesses", "15__CreateJobCollectPerfmonData",
                "16__CreateJobCollectWaitStats", "17__CreateJobCollectXEvents", "18__CreateJobCollectFileIOStats",
                "19__CreateJobPartitionsMaintenance", "20__CreateJobPurgeTables", "21__CreateJobRemoveXEventFiles",
                "22__CreateJobRunWhoIsActive", "23__CreateJobRunBlitzIndex", "24__CreateJobRunBlitzIndexWeekly",
                "25__CreateJobCollectMemoryClerks", "26__CreateJobCheckSQLAgentJobs", "27__CreateJobUpdateSqlServerVersions",
                "28__CreateJobCheckInstanceAvailability", "29__CreateJobGetAllServerInfo", "30__WhoIsActivePartition",
                "31__BlitzIndexPartition", "32__EnablePageCompression", "33__GrafanaLogin",
                "34__LinkedServerOnInventory", "35__LinkedServerForDataDestinationInstance", "36__AlterViewsForDataDestinationInstance")]
    [String[]]$SkipSteps,

    [Parameter(Mandatory=$false)]
    [ValidateSet("1__sp_WhoIsActive", "2__AllDatabaseObjects", "3__XEventSession",
                "4__FirstResponderKitObjects", "5__DarlingDataObjects", "6__OlaHallengrenSolutionObjects",
                "7__sp_WhatIsRunning", "8__usp_GetAllServerInfo", "9__CopyDbaToolsModule2Host",
                "10__CopyPerfmonFolder2Host", "11__SetupPerfmonDataCollector", "12__CreateCredentialProxy",
                "13__CreateJobCollectDiskSpace", "14__CreateJobCollectOSProcesses", "15__CreateJobCollectPerfmonData",
                "16__CreateJobCollectWaitStats", "17__CreateJobCollectXEvents", "18__CreateJobCollectFileIOStats",
                "19__CreateJobPartitionsMaintenance", "20__CreateJobPurgeTables", "21__CreateJobRemoveXEventFiles",
                "22__CreateJobRunWhoIsActive", "23__CreateJobRunBlitzIndex", "24__CreateJobRunBlitzIndexWeekly",
                "25__CreateJobCollectMemoryClerks", "26__CreateJobCheckSQLAgentJobs", "27__CreateJobUpdateSqlServerVersions",
                "28__CreateJobCheckInstanceAvailability", "29__CreateJobGetAllServerInfo", "30__WhoIsActivePartition",
                "31__BlitzIndexPartition", "32__EnablePageCompression", "33__GrafanaLogin",
                "34__LinkedServerOnInventory", "35__LinkedServerForDataDestinationInstance", "36__AlterViewsForDataDestinationInstance")]
    [String]$StopAtStep,

    [Parameter(Mandatory=$false)]
    [ValidateSet("1__sp_WhoIsActive", "2__AllDatabaseObjects", "3__XEventSession",
                "4__FirstResponderKitObjects", "5__DarlingDataObjects", "6__OlaHallengrenSolutionObjects",
                "7__sp_WhatIsRunning", "8__usp_GetAllServerInfo", "9__CopyDbaToolsModule2Host",
                "10__CopyPerfmonFolder2Host", "11__SetupPerfmonDataCollector", "12__CreateCredentialProxy",
                "13__CreateJobCollectDiskSpace", "14__CreateJobCollectOSProcesses", "15__CreateJobCollectPerfmonData",
                "16__CreateJobCollectWaitStats", "17__CreateJobCollectXEvents", "18__CreateJobCollectFileIOStats",
                "19__CreateJobPartitionsMaintenance", "20__CreateJobPurgeTables", "21__CreateJobRemoveXEventFiles",
                "22__CreateJobRunWhoIsActive", "23__CreateJobRunBlitzIndex", "24__CreateJobRunBlitzIndexWeekly",
                "25__CreateJobCollectMemoryClerks", "26__CreateJobCheckSQLAgentJobs", "27__CreateJobUpdateSqlServerVersions",
                "28__CreateJobCheckInstanceAvailability", "29__CreateJobGetAllServerInfo", "30__WhoIsActivePartition",
                "31__BlitzIndexPartition", "32__EnablePageCompression", "33__GrafanaLogin",
                "34__LinkedServerOnInventory", "35__LinkedServerForDataDestinationInstance", "36__AlterViewsForDataDestinationInstance")]
    [String[]]$OnlySteps,

    [Parameter(Mandatory=$false)]
    [PSCredential]$SqlCredential,

    [Parameter(Mandatory=$false)]
    [PSCredential]$WindowsCredential,

    [Parameter(Mandatory=$false)]
    [int]$RetentionDays,

    [Parameter(Mandatory=$false)]
    [bool]$DropCreatePowerShellJobs = $false,

    [Parameter(Mandatory=$false)]
    [bool]$DropCreateWhoIsActiveTable = $false,

    [Parameter(Mandatory=$false)]
    [bool]$SkipPowerShellJobs = $false,

    [Parameter(Mandatory=$false)]
    [bool]$SkipMultiServerviewsUpgrade = $true,

    [Parameter(Mandatory=$false)]
    [bool]$SkipTsqlJobs = $false,

    [Parameter(Mandatory=$false)]
    [bool]$SkipRDPSessionSteps = $false,

    [Parameter(Mandatory=$false)]
    [bool]$SkipWindowsAdminAccessTest = $false,

    [Parameter(Mandatory=$false)]
    [bool]$SkipMailProfileCheck = $false,

    [Parameter(Mandatory=$false)]
    [bool]$SkipCollationCheck = $false,

    [Parameter(Mandatory=$false)]
    [bool]$SkipPageCompression = $false,

    [Parameter(Mandatory=$false)]
    [bool]$SkipDriveCheck = $false,

    [Parameter(Mandatory=$false)]
    [bool]$SkipPingCheck = $false,

    [Parameter(Mandatory=$false)]
    [bool]$HasCustomizedTsqlJobs = $false,

    [Parameter(Mandatory=$false)]
    [bool]$HasCustomizedPowerShellJobs = $false,

    [Parameter(Mandatory=$false)]
    [bool]$OverrideCustomizedTsqlJobs = $false,

    [Parameter(Mandatory=$false)]
    [bool]$OverrideCustomizedPowerShellJobs = $false,

    [Parameter(Mandatory=$false)]
    [bool]$ForceSetupOfTaskSchedulerJobs = $false,

    [Parameter(Mandatory=$false)]
    [bool]$ConfirmValidationOfMultiInstance = $false,

    [Parameter(Mandatory=$false)]
    [bool]$ConfirmSetupOfTaskSchedulerJobs = $false,

    [Parameter(Mandatory=$false)]
    [bool]$DryRun = $false,

    [Parameter(Mandatory=$false)]
    [String]$PreQuery,

    [Parameter(Mandatory=$false)]
    [String]$PostQuery
)

$startTime = Get-Date
$ErrorActionPreference = "Stop"
$sqlmonitorVersion = '1.5.0.4'
$releaseDiscussionURL = "https://ajaydwivedi.com/sqlmonitor/common-errors"
<#
    v1.6.0 - 2023-Sep-30

    v1.5.0.4 - Intermediate Release - 2023-Jul-19
        -> Issue#270 - Add feature to Ignore Existing Jobs if Customized
        -> Issue#269 - Add last execution duration in table dbo.sql_agent_job_stats
        -> Issue#268 - Add tables sql_agent_job_stats & memory_clerks in Collection Latency Dashboard
        -> Issue#267 - Error in M/r Grants Pending panel on Monitoring - Live - Distributed dashboard
        -> Issue#265 - Disabled Jobs Not Appearing in Dashboard Panel SQLAgent Job Activity Monitor
    v1.5.0 - 2023-June-30
        -> Issue#255 - Support of SQLExpress for Inventory Setup
    v1.4.0 - 2023-Mar-31
        -> https://github.com/imajaydwivedi/SQLMonitor/releases/tag/v1.4.0
#>

# Check if PortNo is specified
$Port4SqlInstanceToBaseline = $null
$SqlInstanceToBaselineWithOutPort = $SqlInstanceToBaseline
if($SqlInstanceToBaseline -match "(?'SqlInstance'.+),(?'PortNo'\d+)") {
    $Port4SqlInstanceToBaseline = $Matches['PortNo']
    $SqlInstanceToBaselineWithOutPort = $Matches['SqlInstance']
}

$Port4InventoryServer = $null
$InventoryServerWithOutPort = $InventoryServer
if($SqlInstanceToBaseline -ne $InventoryServer) {
    if($InventoryServer -match "(?'SqlInstance'.+),(?'PortNo'\d+)") {
        $Port4InventoryServer = $Matches['PortNo']
        $InventoryServerWithOutPort = $Matches['SqlInstance']
    }
} else {
    $Port4InventoryServer = $Port4SqlInstanceToBaseline
}


"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'START:', "Working on server [$SqlInstanceToBaseline]." | Write-Host -ForegroundColor Yellow
if(-not [String]::IsNullOrEmpty($Port4SqlInstanceToBaseline)) {
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "SQL Port for [$SqlInstanceToBaseline] => $Port4SqlInstanceToBaseline." | Write-Host -ForegroundColor Yellow
}
"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'START:', "Deploying SQLMonitor v$sqlmonitorVersion.." | Write-Host -ForegroundColor Yellow
"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'START:', "For issues with this version, kindly visit $releaseDiscussionURL" | Write-Host -ForegroundColor Yellow
"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'START:', "For general support, join #sqlmonitor channel on 'sqlcommunity.slack.com <https://ajaydwivedi.com/go/slack>' workspace.`n" | Write-Host -ForegroundColor Yellow
"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'START:', "For paid support, kindly reach out to 'Ajay Dwivedi <ajay.dwivedi2007@gmail.com>'`n" | Write-Host -ForegroundColor Yellow


# All Steps
$AllSteps = @(  "1__sp_WhoIsActive", "2__AllDatabaseObjects", "3__XEventSession",
                "4__FirstResponderKitObjects", "5__DarlingDataObjects", "6__OlaHallengrenSolutionObjects",
                "7__sp_WhatIsRunning", "8__usp_GetAllServerInfo", "9__CopyDbaToolsModule2Host",
                "10__CopyPerfmonFolder2Host", "11__SetupPerfmonDataCollector", "12__CreateCredentialProxy",
                "13__CreateJobCollectDiskSpace", "14__CreateJobCollectOSProcesses", "15__CreateJobCollectPerfmonData",
                "16__CreateJobCollectWaitStats", "17__CreateJobCollectXEvents", "18__CreateJobCollectFileIOStats",
                "19__CreateJobPartitionsMaintenance", "20__CreateJobPurgeTables", "21__CreateJobRemoveXEventFiles",
                "22__CreateJobRunWhoIsActive", "23__CreateJobRunBlitzIndex", "24__CreateJobRunBlitzIndexWeekly",
                "25__CreateJobCollectMemoryClerks", "26__CreateJobCheckSQLAgentJobs", "27__CreateJobUpdateSqlServerVersions",
                "28__CreateJobCheckInstanceAvailability", "29__CreateJobGetAllServerInfo", "30__WhoIsActivePartition",
                "31__BlitzIndexPartition", "32__EnablePageCompression", "33__GrafanaLogin",
                "34__LinkedServerOnInventory", "35__LinkedServerForDataDestinationInstance", "36__AlterViewsForDataDestinationInstance")

# TSQL Jobs
$TsqlJobSteps = @(
                "16__CreateJobCollectWaitStats", "17__CreateJobCollectXEvents", "18__CreateJobCollectFileIOStats",
                "19__CreateJobPartitionsMaintenance", "20__CreateJobPurgeTables", "22__CreateJobRunWhoIsActive",
                "21__CreateJobRemoveXEventFiles", "23__CreateJobRunBlitzIndex", "24__CreateJobRunBlitzIndexWeekly",
                "25__CreateJobCollectMemoryClerks", "26__CreateJobCheckSQLAgentJobs")

# PowerShell Jobs
$PowerShellJobSteps = @(
                "13__CreateJobCollectDiskSpace", "14__CreateJobCollectOSProcesses", "15__CreateJobCollectPerfmonData",
                "27__CreateJobUpdateSqlServerVersions", "28__CreateJobCheckInstanceAvailability")

# RDPSessionSteps
$RDPSessionSteps = @("9__CopyDbaToolsModule2Host", "10__CopyPerfmonFolder2Host", "11__SetupPerfmonDataCollector")


# Validate to ensure either of Skip Or Only Steps are provided
if($OnlySteps.Count -gt 0 -and $SkipSteps.Count -gt 0) {
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Parameters {OnlySteps} & {SkipSteps} are mutually exclusive.`n`tOnly one of these should be provided." | Write-Host -ForegroundColor Red
    Write-Error "Stop here. Fix above issue."
}

# Print warning if OnlySteps are provided
if($OnlySteps.Count -gt 0) {
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "Parameter {OnlySteps} has been provided.`n`tThis parameter is mutually exclusive with other parameters.`n`tSo overrides all other parameters." | Write-Host -ForegroundColor Yellow
    Write-Warning "ATTENTION Required on above message."
}


# Add $PowerShellJobSteps to Skip Jobs
if($SkipPowerShellJobs) {
    $SkipSteps = $SkipSteps + $($PowerShellJobSteps | % {if($_ -notin $SkipSteps){$_}});
}

# Add $RDPSessionSteps to Skip Jobs
if($SkipRDPSessionSteps) {
    $SkipSteps = $SkipSteps + $($RDPSessionSteps | % {if($_ -notin $SkipSteps){$_}});
}

# Print Job Step names
"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$PowerShellJobSteps => `n`n`t`t`t`t$($PowerShellJobSteps -join "`n`t`t`t`t")`n"
"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$RDPSessionSteps => `n`n`t`t`t`t$($RDPSessionSteps -join "`n`t`t`t`t")`n"

# Add $TsqlJobSteps to Skip Jobs
if($SkipTsqlJobs) {
    $SkipSteps = $SkipSteps + $($TsqlJobSteps | % {if($_ -notin $SkipSteps){$_}});
}

# Skip Compression
if($SkipPageCompression -and ('32__EnablePageCompression' -notin $SkipSteps)) {
    $SkipSteps += @('32__EnablePageCompression')
}

# For backward compatability
$SkipAllJobs = $false
if($SkipTsqlJobs -and $SkipPowerShellJobs) {
    $SkipAllJobs = $true
}

"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Clearing old PSSessions.."
Get-PSSession | Remove-PSSession

if($SqlInstanceToBaseline -eq '.' -or $SqlInstanceToBaseline -eq 'localhost') {
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "'localhost' or '.' are not validate SQLInstance names." | Write-Host -ForegroundColor Red
    Write-Error "Stop here. Fix above issue."
}

# Evaluate path of SQLMonitor folder
if( (-not [String]::IsNullOrEmpty($PSScriptRoot)) -or ((-not [String]::IsNullOrEmpty($SQLMonitorPath)) -and $(Test-Path $SQLMonitorPath)) ) {
    if([String]::IsNullOrEmpty($SQLMonitorPath)) {
        $SQLMonitorPath = $(Split-Path $PSScriptRoot -Parent)
    }
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$SQLMonitorPath = '$SQLMonitorPath'"
}
else {
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly provide 'SQLMonitorPath' parameter value" | Write-Host -ForegroundColor Red
    Write-Error "Stop here. Fix above issue."
}

# Logs folder
if($RemoteSQLMonitorPath.EndsWith('\')) {
    $logsPath = $RemoteSQLMonitorPath+'Logs';
} else {
    $logsPath = $RemoteSQLMonitorPath+'\'+'Logs';
}

# Set windows credential if valid AD credential is provided as SqlCredential
if( [String]::IsNullOrEmpty($WindowsCredential) -and (-not [String]::IsNullOrEmpty($SqlCredential)) -and $SqlCredential.UserName -like "*\*" ) {
    $WindowsCredential = $SqlCredential
}

# Remove end trailer of '\'
if($RemoteSQLMonitorPath.EndsWith('\')) {
    $RemoteSQLMonitorPath = $RemoteSQLMonitorPath.TrimEnd('\')
}

"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$SqlInstanceToBaseline = [$SqlInstanceToBaseline]"
"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$SqlCredential => "
$SqlCredential | ft -AutoSize
"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$WindowsCredential => "
$WindowsCredential | ft -AutoSize

# Construct File Path Variables
$ddlPath = Join-Path $SQLMonitorPath "DDLs"
$psScriptPath = Join-Path $SQLMonitorPath "SQLMonitor"
$isUpgradeScenario = $false

$mailProfileFilePath = "$ddlPath\$MailProfileFileName"
$WhoIsActiveFilePath = "$ddlPath\$WhoIsActiveFileName"
$AllDatabaseObjectsFilePath = "$ddlPath\$AllDatabaseObjectsFileName"
$InventorySpecificObjectsFilePath = "$ddlPath\$InventorySpecificObjectsFileName"
$XEventSessionFilePath = "$ddlPath\$XEventSessionFileName"
$WhatIsRunningFilePath = "$ddlPath\$WhatIsRunningFileName"
$GetAllServerInfoFilePath = "$ddlPath\$UspGetAllServerInfoFileName"
$UspWrapperGetAllServerInfoFilePath = "$ddlPath\$UspWrapperGetAllServerInfoFileName"
$UspCollectWaitStatsFilePath = "$ddlPath\$UspCollectWaitStatsFileName"
$UspCollectFileIOStatsFilePath = "$ddlPath\$UspCollectFileIOStatsFileName"
$UspCollectXeventsResourceConsumptionFilePath = "$ddlPath\$UspCollectXeventsResourceConsumptionFileName"
$UspPartitionMaintenanceFilePath = "$ddlPath\$UspPartitionMaintenanceFileName"
$UspPurgeTablesFilePath = "$ddlPath\$UspPurgeTablesFileName"
$UspRunWhoIsActiveFilePath = "$ddlPath\$UspRunWhoIsActiveFileName"
$UspActiveRequestsCountFilePath = "$ddlPath\$UspActiveRequestsCountFileName"
$UspWaitsPerCorePerMinuteFilePath = "$ddlPath\$UspWaitsPerCorePerMinuteFileName"
$UspEnablePageCompressionFilePath = "$ddlPath\$UspEnablePageCompressionFileName"
$UspCollectMemoryClerksFilePath = "$ddlPath\$UspCollectMemoryClerksFileName"
$UspCheckSQLAgentJobsFilePath = "$ddlPath\$UspCheckSQLAgentJobsFileName"
$WhoIsActivePartitionFilePath = "$ddlPath\$WhoIsActivePartitionFileName"
$BlitzIndexPartitionFilePath = "$ddlPath\$BlitzIndexPartitionFileName"
$GrafanaLoginFilePath = "$ddlPath\$GrafanaLoginFileName"
$CheckInstanceAvailabilityJobFilePath = "$ddlPath\$CheckInstanceAvailabilityJobFileName"
$CollectDiskSpaceJobFilePath = "$ddlPath\$CollectDiskSpaceJobFileName"
$CollectOSProcessesJobFilePath = "$ddlPath\$CollectOSProcessesJobFileName"
$CollectPerfmonDataJobFilePath = "$ddlPath\$CollectPerfmonDataJobFileName"
$CollectWaitStatsJobFilePath = "$ddlPath\$CollectWaitStatsJobFileName"
$CollectFileIOStatsJobFilePath = "$ddlPath\$CollectFileIOStatsJobFileName"
$CollectXEventsJobFilePath = "$ddlPath\$CollectXEventsJobFileName"
$GetAllServerInfoJobFilePath = "$ddlPath\$GetAllServerInfoJobFileName"
$PartitionsMaintenanceJobFilePath = "$ddlPath\$PartitionsMaintenanceJobFileName"
$PurgeTablesJobFilePath = "$ddlPath\$PurgeTablesJobFileName"
$RemoveXEventFilesJobFilePath = "$ddlPath\$RemoveXEventFilesJobFileName"
$RunWhoIsActiveJobFilePath = "$ddlPath\$RunWhoIsActiveJobFileName"
$RunBlitzIndexJobFilePath = "$ddlPath\$RunBlitzIndexJobFileName"
$RunBlitzIndexWeeklyJobFilePath = "$ddlPath\$RunBlitzIndexWeeklyJobFileName"
$CollectMemoryClerksJobFilePath = "$ddlPath\$CollectMemoryClerksJobFileName"
$CheckSQLAgentJobsJobFilePath = "$ddlPath\$CheckSQLAgentJobsJobFileName"
$UpdateSqlServerVersionsJobFilePath = "$ddlPath\$UpdateSqlServerVersionsJobFileName"
$LinkedServerOnInventoryFilePath = "$ddlPath\$LinkedServerOnInventoryFileName"
$TestWindowsAdminAccessJobFilePath = "$ddlPath\$TestWindowsAdminAccessJobFileName"

"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$ddlPath = '$ddlPath'"
"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$psScriptPath = '$psScriptPath'"

"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Import dbatools module.."
Import-Module dbatools

# Compute steps to execute
"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Compute Steps to execute.."
$StartAtStepNumber = 1
$StopAtStepNumber = $AllSteps.Count+1

if(-not [String]::IsNullOrEmpty($StartAtStep)) {
    [int]$StartAtStepNumber = $StartAtStep -replace "__\w+", ''
}
if(-not [String]::IsNullOrEmpty($StopAtStep)) {
    [int]$StopAtStepNumber = $StopAtStep -replace "__\w+", ''
}


$Steps2Execute = @()
$Steps2ExecuteRaw = @()
if(-not [String]::IsNullOrEmpty($SkipSteps)) {
    $Steps2ExecuteRaw += Compare-Object -ReferenceObject $AllSteps -DifferenceObject $SkipSteps | Where-Object {$_.SideIndicator -eq '<='} | Select-Object -ExpandProperty InputObject -Unique
}
else {
    $Steps2ExecuteRaw += $AllSteps
}

$Steps2Execute += $Steps2ExecuteRaw | ForEach-Object { 
                            $currentStepNumber = [int]$($_ -replace "__\w+", '');
                            $passThrough = $true;
                            if( -not ($currentStepNumber -ge $StartAtStepNumber -and $currentStepNumber -le $StopAtStepNumber) ) {
                                $passThrough = $false
                            }
                            if( $passThrough -and ($SkipAllJobs -and $_ -like '*__CreateJob*') ) {
                                $passThrough = $false
                            }
                            if($passThrough) {$_}
                        }

if($OnlySteps.Count -gt 0) {
    # Override Steps to Execute by OnlySteps parameter value
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Override `$Steps2Execute with value from `$OnlySteps.."
    $Steps2Execute = $OnlySteps
}

"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$StartAtStep -> $StartAtStep.."
"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$StopAtStep -> $StopAtStep.."
"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Total steps to execute -> $($Steps2Execute.Count)."

# Setup SQL Connection for Inventory
try {
    #if($InventoryServer -ne $SqlInstanceToBaseline) {
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "[Connect-DbaInstance] Create connection for InventoryServer '$InventoryServer'.."
    $conInventoryServer = Connect-DbaInstance -SqlInstance $InventoryServer -Database master -ClientName "Wrapper-InstallSQLMonitor.ps1" `
                                                    -SqlCredential $SqlCredential -TrustServerCertificate -ErrorAction Stop
    #} else {
        #$conInventoryServer = $conSqlInstanceToBaseline
    #}
}
catch {
    $errMessage = $_
    
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "SQL Connection to [$InventoryServer] failed." | Write-Host -ForegroundColor Red
    if([String]::IsNullOrEmpty($SqlCredential)) {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly provide SqlCredentials." | Write-Host -ForegroundColor Red
    } else {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Provided SqlCredentials seems to be NOT working." | Write-Host -ForegroundColor Red
    }
    Write-Error "Stop here. Fix above issue."
}

# Get dbo.instance_details info
"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Fetching info from [$InventoryServer].[$InventoryDatabase].[dbo].[instance_details].."
$instanceDetails = @()
if([String]::IsNullOrEmpty($HostName)) {
    $sqlInstanceDetails = "select * from dbo.instance_details where sql_instance = '$SqlInstanceToBaselineWithOutPort'"
}
else {
    $sqlInstanceDetails = "select * from dbo.instance_details where sql_instance = '$SqlInstanceToBaselineWithOutPort' and [host_name] = '$HostName'"
}
try {
    $instanceDetails += Invoke-DbaQuery -SqlInstance $conInventoryServer -Database $InventoryDatabase -Query $sqlInstanceDetails

    if($instanceDetails.Count -eq 1) 
    {
        # If SQL Port is not provided, but should be present
        if ([String]::IsNullOrEmpty($Port4SqlInstanceToBaseline)) 
        {
            if (-not [String]::IsNullOrEmpty($instanceDetails.sql_instance_port)) 
            {
                $Port4SqlInstanceToBaseline = $instanceDetails.sql_instance_port
                $SqlInstanceToBaseline = "$SqlInstanceToBaseline,$Port4SqlInstanceToBaseline"
                $SqlInstanceToBaselineWithOutPort = $SqlInstanceToBaseline
            }
        }
    }
}
catch {
    $errMessage = $_

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Could not fetch details from [$InventoryServer].[$InventoryDatabase].[dbo].[instance_details] info."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "So assuming fresh installation of SQLMonitor."
}

# Setup SQL Connection for SqlInstanceToBaseline
try {
    if ($SqlInstanceToBaseline -ne $InventoryServer) {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "[Connect-DbaInstance] Create connection for '$SqlInstanceToBaseline'.."
        $conSqlInstanceToBaseline = Connect-DbaInstance -SqlInstance $SqlInstanceToBaseline -Database master -ClientName "Wrapper-InstallSQLMonitor.ps1" `
                                                        -SqlCredential $SqlCredential -TrustServerCertificate -ErrorAction Stop
    }
    else {
        $conSqlInstanceToBaseline = $conInventoryServer
    }
}
catch {
    $errMessage = $_
    
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "SQL Connection to [$SqlInstanceToBaseline] failed." | Write-Host -ForegroundColor Red
    if([String]::IsNullOrEmpty($SqlCredential)) {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly provide SqlCredentials." | Write-Host -ForegroundColor Red
    } else {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Provided SqlCredentials seems to be NOT working." | Write-Host -ForegroundColor Red
    }
    Write-Error "Stop here. Fix above issue."
}


# Get Server Info
"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Fetching basic server info for `$SqlInstanceToBaseline => [$SqlInstanceToBaseline].."
$sqlServerInfo = @"
DECLARE @Domain NVARCHAR(255);
begin try
	EXEC master.dbo.xp_regread 'HKEY_LOCAL_MACHINE', 'SYSTEM\CurrentControlSet\services\Tcpip\Parameters', N'Domain',@Domain OUTPUT;
end try
begin catch
	print 'some erorr accessing registry'
end catch

select	[domain] = default_domain(),
		[domain_reg] = @Domain,
		--[ip] = CONNECTIONPROPERTY('local_net_address'),
		[@@SERVERNAME] = @@SERVERNAME,
		[MachineName] = serverproperty('MachineName'),
		[ServerName] = serverproperty('ServerName'),
		[host_name] = SERVERPROPERTY('ComputerNamePhysicalNetBIOS'),
		SERVERPROPERTY('ProductVersion') AS ProductVersion,
		[service_name_str] = servicename,
		[service_name] = case	when @@servicename = 'MSSQLSERVER' and servicename like 'SQL Server (%)' then 'MSSQLSERVER'
								when @@servicename = 'MSSQLSERVER' and servicename like 'SQL Server Agent (%)' then 'SQLSERVERAGENT'
								when @@servicename <> 'MSSQLSERVER' and servicename like 'SQL Server (%)' then 'MSSQL$'+@@servicename
								when @@servicename <> 'MSSQLSERVER' and servicename like 'SQL Server Agent (%)' then 'SQLAgent'+@@servicename
								else 'MSSQL$'+@@servicename end,
        service_account,
		SERVERPROPERTY('Edition') AS Edition,
        [is_clustered] = case when exists (select 1 from sys.dm_os_cluster_nodes) then 1 else 0 end
from sys.dm_server_services 
where servicename like 'SQL Server (%)'
or servicename like 'SQL Server Agent (%)'
"@
try {
    $resultServerInfo = Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Query $sqlServerInfo -EnableException
    $dbServiceInfo = $resultServerInfo | Where-Object {$_.service_name_str -like "SQL Server (*)"}
    $agentServiceInfo = $resultServerInfo | Where-Object {$_.service_name_str -like "SQL Server Agent (*)"}
    $resultServerInfo | Format-Table -AutoSize
}
catch {
    $errMessage = $_
    
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "SQL Connection to [$SqlInstanceToBaseline] failed."
    if([String]::IsNullOrEmpty($SqlCredential)) {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly provide SqlCredentials." | Write-Host -ForegroundColor Red
    } else {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Provided SqlCredentials seems to be NOT working." | Write-Host -ForegroundColor Red
    }
    Write-Error "Stop here. Fix above issue."
}

# Extract Version Info & Partition Info
"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Extract Major & Minor Version of SQL Server.."
[bool]$IsNonPartitioned = $true
if($dbServiceInfo.ProductVersion -match "(?'MajorVersion'\d+)\.\d+\.(?'MinorVersion'\d+)\.\d+")
{
    [int]$MajorVersion = $Matches['MajorVersion']
    [int]$MinorVersion = $Matches['MinorVersion']
    [bool]$IsCompressionSupported = $false

    if($dbServiceInfo.Edition -like 'Enterprise*' -or $dbServiceInfo.Edition -like 'Developer*') {
        $IsNonPartitioned = $false
    }
    elseif($dbServiceInfo.Edition -like 'Standard*' -or $dbServiceInfo.Edition -like 'Express*')
    {
        if($MajorVersion -gt 13) {
            $IsNonPartitioned = $false
        }
        elseif ($MajorVersion -eq 13 -and $MinorVersion -ge 4001) {
            $IsNonPartitioned = $false
        }
    }

    if($MajorVersion -ge 13) {
        $IsCompressionSupported = $true
    }
    elseif ($dbServiceInfo.Edition -like 'Enterprise*' -or $dbServiceInfo.Edition -like 'Developer*') {
        $IsCompressionSupported = $true
    }
}

# Extract domain & isClustered property
[bool]$isClustered = $dbServiceInfo.is_clustered
[string]$domain = $dbServiceInfo.domain_reg
if([String]::IsNullOrEmpty($domain)) {
    if($dbServiceInfo.domain -ne 'WORKGROUP') {
        $domain = $dbServiceInfo.domain+'.com'
    }
    else {
        $domain = $dbServiceInfo.domain
    }
}

# Get dbo.instance_details info
"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Fetching info from [dbo].[instance_details].."
$instanceDetails = @()
if([String]::IsNullOrEmpty($HostName)) {
    $sqlInstanceDetails = "select * from dbo.instance_details where sql_instance = '$SqlInstanceToBaselineWithOutPort'"
}
else {
    $sqlInstanceDetails = "select * from dbo.instance_details where sql_instance = '$SqlInstanceToBaselineWithOutPort' and [host_name] = '$HostName'"
}
try {
    $instanceDetails += Invoke-DbaQuery -SqlInstance $conInventoryServer -Database $InventoryDatabase -Query $sqlInstanceDetails
    if($instanceDetails.Count -eq 0) {
        $instanceDetails += Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -Query $sqlInstanceDetails -EnableException
    }
}
catch {
    $errMessage = $_

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Could not fetch details from dbo.instance_details info."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "So assuming fresh installation of SQLMonitor."
}

# If instance details found, then use same to initiate empty parameters
if ( $instanceDetails.Count -gt 0 ) 
{
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Instance details found in [dbo].[instance_details]."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Using available info from this table."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Incase details of [dbo].[instance_details] are outdated, `n`t`t`t`tconsider updating same 1st on Inventory & Local Instance both."
    $instanceDetails | ft -AutoSize

    # If more than 1 host is found, then confirm from user
    if ( $instanceDetails.Count -gt 1 ) 
    {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Multiple Hosts detected for SqlInstance [$SqlInstanceToBaseline]." | Write-Host -ForegroundColor Red
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly specify HostName parameter related to SqlInstance [$SqlInstanceToBaseline]." | Write-Host -ForegroundColor Red
        
        "STOP here, and fix above issue." | Write-Error
    }    

    # If no DBA Mail provided, then fetch from dbo.instance_details
    if($DbaGroupMailId.Count -eq 0) {
        $DbaGroupMailId += $($instanceDetails.dba_group_mail_id -split ';')
    }

    # If SQL Port is not provided, but should be present
    if ([String]::IsNullOrEmpty($Port4SqlInstanceToBaseline)) {
        if (-not [String]::IsNullOrEmpty($instanceDetails.sql_instance_port)) {
            $Port4SqlInstanceToBaseline = $instanceDetails.sql_instance_port
            $SqlInstanceToBaseline = "$SqlInstanceToBaseline,$Port4SqlInstanceToBaseline"
            $SqlInstanceToBaselineWithOutPort = $SqlInstanceToBaseline
        }
    }

    if( ($RemoteSQLMonitorPath -ne $instanceDetails.sqlmonitor_script_path) -and $RemoteSQLMonitorPath -ne 'C:\SQLMonitor' ) {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "RemoteSQLMonitorPath parameter value does not match with dbo.instance_details." | Write-Host -ForegroundColor Red
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Consider updating details of dbo.instance_details on Inventory & Local Instance both."
        
        "STOP here, and fix above issue." | Write-Error
    }else {
        if( ($RemoteSQLMonitorPath -ne $instanceDetails.sqlmonitor_script_path) -and $RemoteSQLMonitorPath -eq 'C:\SQLMonitor' ) {
            $RemoteSQLMonitorPath = $instanceDetails.sqlmonitor_script_path
        }
    }

    if ([String]::IsNullOrEmpty($SqlInstanceAsDataDestination)) {
        $SqlInstanceAsDataDestination = $instanceDetails.data_destination_sql_instance
    }
    else {
        if( $SqlInstanceAsDataDestination -ne $instanceDetails.data_destination_sql_instance ) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "SqlInstanceAsDataDestination parameter value does not match with dbo.instance_details." | Write-Host -ForegroundColor Red
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Consider updating details of dbo.instance_details on Inventory & Local Instance both."
        
            "STOP here, and fix above issue." | Write-Error
        }
    }

    if ([String]::IsNullOrEmpty($SqlInstanceForPowershellJobs)) {
        $SqlInstanceForPowershellJobs = $instanceDetails.collector_powershell_jobs_server
    }
    else {
        if( $SqlInstanceForPowershellJobs -ne $instanceDetails.collector_powershell_jobs_server ) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "SqlInstanceForPowershellJobs parameter value does not match with dbo.instance_details." | Write-Host -ForegroundColor Red
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Consider updating details of dbo.instance_details on Inventory & Local Instance both."
        
            "STOP here, and fix above issue." | Write-Error
        }
    }

    if ($DbaGroupMailId.Count -eq 0) {
        $DbaGroupMailId += 'some_dba_mail_id@gmail.com'
    }
    
    if ([String]::IsNullOrEmpty($SqlInstanceForTsqlJobs)) {
        $SqlInstanceForTsqlJobs = $instanceDetails.collector_tsql_jobs_server
    }
    else {
        if( $SqlInstanceForTsqlJobs -ne $instanceDetails.collector_tsql_jobs_server ) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "SqlInstanceForTsqlJobs parameter value does not match with dbo.instance_details." | Write-Host -ForegroundColor Red
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Consider updating details of dbo.instance_details on Inventory & Local Instance both."
        
            "STOP here, and fix above issue." | Write-Error
        }
    }

    # Get additional parameter settings
    if (-not [String]::IsNullOrEmpty($instanceDetails.more_info)) {
        $moreInfoJSON = $instanceDetails.more_info
        $moreInfo = $moreInfoJSON | ConvertFrom-Json

        if( ($moreInfo.ForceSetupOfTaskSchedulerJobs -eq $true) -and ($ForceSetupOfTaskSchedulerJobs -ne $moreInfo.ForceSetupOfTaskSchedulerJobs) ) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "ForceSetupOfTaskSchedulerJobs parameter value does not match with dbo.instance_details.more_info." | Write-Host -ForegroundColor Yellow
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "So preferring Inventory Based parameter values over local parameter values passed."
            $ForceSetupOfTaskSchedulerJobs = $true
        }

        if( ($moreInfo.HasCustomizedTsqlJobs -eq $true) -and ($HasCustomizedTsqlJobs -ne $moreInfo.HasCustomizedTsqlJobs) ) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "HasCustomizedTsqlJobs parameter value does not match with dbo.instance_details.more_info." #| Write-Host -ForegroundColor Yellow
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "So preferring Inventory Based parameter values over local parameter values passed."
            $HasCustomizedTsqlJobs = $true            
        }

        if( ($moreInfo.HasCustomizedPowerShellJobs -eq $true) -and ($HasCustomizedPowerShellJobs -ne $moreInfo.HasCustomizedPowerShellJobs) ) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "HasCustomizedPowerShellJobs parameter value does not match with dbo.instance_details.more_info." #| Write-Host -ForegroundColor Yellow
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "So preferring Inventory Based parameter values over local parameter values passed."
            $HasCustomizedPowerShellJobs = $true
        }

        if($OverrideCustomizedTsqlJobs) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "`$HasCustomizedTsqlJobs parameter value has been reset to false based on `$OverrideCustomizedTsqlJobs parameter." | Write-Host -ForegroundColor Yellow
            $HasCustomizedTsqlJobs = $false
        }
        if($OverrideCustomizedPowerShellJobs) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "`$HasCustomizedPowerShellJobs parameter value has been reset to false based on `$OverrideCustomizedPowerShellJobs parameter." | Write-Host -ForegroundColor Yellow
            $HasCustomizedPowerShellJobs = $false
        }
    }

    if( ($DbaDatabase -ne $instanceDetails.database) -and $DbaDatabase -ne 'DBA' ) {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "DbaDatabase parameter value does not match with dbo.instance_details." | Write-Host -ForegroundColor Red
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Consider updating details of dbo.instance_details on Inventory & Local Instance both."
        
        "STOP here, and fix above issue." | Write-Error
    }else {
        if( ($DbaDatabase -ne $instanceDetails.database) -and $DbaDatabase -eq 'DBA' ) {
            $DbaDatabase = $instanceDetails.database
        }
    }

    if(-not $ConfirmValidationOfMultiInstance) {
        $ConfirmValidationOfMultiInstance = $true
    }

    $isUpgradeScenario = $true
}

# If fresh install, then set SkipMultiServerviewsUpgrade to False
if(-not $isUpgradeScenario) {
    $SkipMultiServerviewsUpgrade = $false
}

if($DbaGroupMailId -eq 'some_dba_mail_id@gmail.com') {
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly provide a valid value for DbaGroupMailId parameter." | Write-Host -ForegroundColor Red
    Write-Error "Stop here. Fix above issue."
}


# Fetch HostName for SqlInstance if NULL in parameter value
if([String]::IsNullOrEmpty($HostName)) {
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Extract HostName of SQL Server Instance.."
    $HostName = $dbServiceInfo.host_name;
}
else {
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Validate HostName.."
    # If Sql Cluster, then host can be different
    # If not sql cluster, then host should be same
    if(-not $isClustered) {
        if($HostName -ne $dbServiceInfo.host_name) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Provided HostName does not match with SQLInstance host name." | Write-Host -ForegroundColor Red
            "STOP and check above error message" | Write-Error
        }
    }
}

# Setup PSSession on HostName to setup Perfmon Data Collector. $ssn4PerfmonSetup
if( (($SkipRDPSessionSteps -eq $false) -or $ConfirmSetupOfTaskSchedulerJobs -or $ForceSetupOfTaskSchedulerJobs) ) #-and ($HostName -ne $env:COMPUTERNAME)
{
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Create PSSession for host [$HostName].."
    $ssnHostName = $HostName

    # Try reaching server using HostName provided/detected, if fails, then use FQDN
    if (-not (Test-Connection -ComputerName $ssnHostName -Quiet -Count 1)) {
        if($domain -ne 'WORKGROUP.com' -and $domain -ne 'WORKGROUP') {
            $ssnHostName = "$HostName.$domain"
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "Host [$HostName] not pingable. So trying FQDN form [$ssnHostName].."
        }
    }

    # Try reaching using FQDN, if fails & not a clustered instance, then use SqlInstanceToBaseline itself
    if ( (-not (Test-Connection -ComputerName $ssnHostName -Quiet -Count 1)) -and (-not $isClustered) ) {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "Host [$ssnHostName] not pingable. Since its not clustered instance, So trying `$SqlInstanceToBaseline parameter value itself.."
        $ssnHostName = $SqlInstanceToBaseline
    }

    # If not reachable after all attempts, raise error
    if ( -not (Test-Connection -ComputerName $ssnHostName -Quiet -Count 1) ) {        
        if($SkipPingCheck) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "Host [$ssnHostName] not pingable." | Write-Host -ForegroundColor Cyan
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "Skip ping validation to Host [$ssnHostName].." | Write-Host -ForegroundColor Cyan
        }else {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Host [$ssnHostName] not pingable." | Write-Host -ForegroundColor Red
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly provide HostName either in FQDN or ipv4 format." | Write-Host -ForegroundColor Red
            "STOP and check above error message" | Write-Error        
        }
    }

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$ssnHostName => '$ssnHostName'"
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Domain of SqlInstance being baselined => [$domain]"
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Domain of current host => [$($env:USERDOMAIN)]"

    $ssn4PerfmonSetup = $null
    $errVariables = @()

    # First Attempt without Any credentials
    try {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Trying for PSSession on [$ssnHostName] normally.."
            $ssn4PerfmonSetup = New-PSSession -ComputerName $ssnHostName 
        }
    catch { $errVariables += $_ }

    # Second Attempt for Trusted Cross Domains
    if( [String]::IsNullOrEmpty($ssn4PerfmonSetup) ) {
        try { 
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Trying for PSSession on [$ssnHostName] assuming cross domain.."
            $ssn4PerfmonSetup = New-PSSession -ComputerName $ssnHostName -Authentication Negotiate 
        }
        catch { $errVariables += $_ }
    }

    # 3rd Attempt with Credentials
    if( [String]::IsNullOrEmpty($ssn4PerfmonSetup) -and (-not [String]::IsNullOrEmpty($WindowsCredential)) ) {
        try {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Attemping PSSession for [$ssnHostName] using provided WindowsCredentials.."
            $ssn4PerfmonSetup = New-PSSession -ComputerName $ssnHostName -Credential $WindowsCredential    
        }
        catch { $errVariables += $_ }

        if( [String]::IsNullOrEmpty($ssn4PerfmonSetup) ) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Attemping PSSession for [$ssnHostName] using provided WindowsCredentials with Negotiate attribute.."
            $ssn4PerfmonSetup = New-PSSession -ComputerName $ssnHostName -Credential $WindowsCredential -Authentication Negotiate
        }
    }

    if ( [String]::IsNullOrEmpty($ssn4PerfmonSetup) ) {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Provide WindowsCredential for accessing server [$ssnHostName] of domain '$domain'." | Write-Host -ForegroundColor Red
        "STOP here, and fix above issue." | Write-Error
    }

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$ssn4PerfmonSetup PSSession for [$HostName].."
    $ssn4PerfmonSetup
    "`n"
}

# Validate if IPv4 is provided instead of DNS name for HostName
$pattern = "^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$"
if($HostName  -match $pattern) {
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "IP address has been provided for `$HostName parameter."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Fetching DNS name for [$HostName].."
    $HostName = Invoke-Command -Session $ssn4PerfmonSetup -ScriptBlock { $env:COMPUTERNAME }
}

# Validate if FQDN is provided instead of single part HostName
$pattern = "(?=^.{4,253}$)(^((?!-)[a-zA-Z0-9-]{1,63}(?<!-)\.)+[a-zA-Z]{2,63}$)"
if($HostName  -match $pattern) {
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "FQDN has been provided for `$HostName parameter."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Fetching DNS name for [$HostName].."
    $HostName = Invoke-Command -Session $ssn4PerfmonSetup -ScriptBlock { $env:COMPUTERNAME }
}

# Check No of SQL Services on HostName
if( ($SkipPowerShellJobs -eq $false) -or ('21__CreateJobRemoveXEventFiles' -in $Steps2Execute) )
{
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Check for number of SQLServices on [$HostName].."

    $sqlServicesOnHost = @()

    # Localhost system
    if( $HostName -eq $env:COMPUTERNAME ) {
        $sqlServicesOnHost += Get-Service MSSQL* | Where-Object {$_.DisplayName -like 'SQL Server (*)' -and $_.StartType -ne 'Disabled'}
    }
    
    # Remote host
    if($HostName -ne $env:COMPUTERNAME)
    {
        # if pssession is null
        if([String]::IsNullOrEmpty($ssn4PerfmonSetup)) 
        {
            # If Destination instance is not provided, throw error
            if([String]::IsNullOrEmpty($SqlInstanceAsDataDestination) -or (-not $ConfirmValidationOfMultiInstance)) {
                "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly provide values for parameter SqlInstanceAsDataDestination & ConfirmValidationOfMultiInstance as `$ssn4PerfmonSetup is null." | Write-Host -ForegroundColor Red
                "STOP here, and fix above issue." | Write-Error
            }
        }
        
        # if pssession is not null
        if(-not [String]::IsNullOrEmpty($ssn4PerfmonSetup)) {
        $sqlServicesOnHost += Invoke-Command -Session $ssn4PerfmonSetup -ScriptBlock { 
                                    Get-Service MSSQL* | Where-Object {$_.DisplayName -like 'SQL Server (*)' -and $_.StartType -ne 'Disabled'} 
                            }
        }
    }

    # If more than one sql services found, then ensure appropriate parameters are provided
    if($sqlServicesOnHost.Count -gt 1) 
    {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "[$($sqlServicesOnHost.Count)] database engine Services found on [$HostName].."

        # If Destination instance is not provided, throw error
        if([String]::IsNullOrEmpty($SqlInstanceAsDataDestination) -or (-not $ConfirmValidationOfMultiInstance)) 
        {
            if([String]::IsNullOrEmpty($SqlInstanceAsDataDestination)) {
                "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly provide value for parameter SqlInstanceAsDataDestination as host has multiple database engine services, `n`t and Perfmon data can be saved on only on one SQLInstance." | Write-Host -ForegroundColor Red
            }
            if(-not $ConfirmValidationOfMultiInstance) {
                "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly set ConfirmValidationOfMultiInstance parameter to true as host has multiple database engine services, `n`t and Perfmon data can be saved on only on one SQLInstance." | Write-Host -ForegroundColor Red
            }

            "STOP here, and fix above issue." | Write-Error
        }
        # If destination is provided, then validate if perfmon is not already get collected
        else {
            
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Validate if Perfmon data is not being collected already on [$SqlInstanceAsDataDestination] for same host.."
            $sqlPerfmonRecord = @"
if OBJECT_ID('dbo.performance_counters') is not null
begin
	select top 1 'dbo.performance_counters' as QueryData, getutcdate() as current_time_utc, collection_time_utc, pc.host_name
	from dbo.performance_counters pc with (nolock)
	where pc.collection_time_utc >= DATEADD(minute,-20,GETUTCDATE()) and host_name = '$HostName'
	order by pc.collection_time_utc desc
end
"@
            $resultPerfmonRecord = @()
            $resultPerfmonRecord += Invoke-DbaQuery -SqlInstance $conSqlInstanceAsDataDestination -Database $DbaDatabase -Query $sqlPerfmonRecord -EnableException
            if($resultPerfmonRecord.Count -eq 0) {
                "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "No Perfmon data record found for last 20 minutes for host [$HostName] on [$SqlInstanceAsDataDestination]."
            }
            else {
                "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "Perfmon data records of latest 20 minutes for host [$HostName] are present on [$SqlInstanceAsDataDestination]."
            }
        }
    }
}

# Set $SqlInstanceAsDataDestination same as $SqlInstanceToBaseline if NULL
$Port4SqlInstanceAsDataDestination = $null
$SqlInstanceAsDataDestinationWithOutPort = $SqlInstanceToBaselineWithOutPort
if([String]::IsNullOrEmpty($SqlInstanceAsDataDestination)) {
    $SqlInstanceAsDataDestination = $SqlInstanceToBaseline
    $SqlInstanceAsDataDestinationWithOutPort = $SqlInstanceToBaselineWithOutPort
} else {
    # Check if PortNo is specified
    if($SqlInstanceAsDataDestination -match "(?'SqlInstance'.+),(?'PortNo'\d+)") {
        $Port4SqlInstanceAsDataDestination = $Matches['PortNo']
        $SqlInstanceAsDataDestinationWithOutPort = $Matches['SqlInstance']
    }
}

# Set $SqlInstanceForTsqlJobs same as $SqlInstanceToBaseline if NULL
$Port4SqlInstanceForTsqlJobs = $null
if([String]::IsNullOrEmpty($SqlInstanceForTsqlJobs)) {
    $SqlInstanceForTsqlJobs = $SqlInstanceToBaseline
    $SqlInstanceForTsqlJobsWithOutPort = $SqlInstanceToBaselineWithOutPort
} else {
    # Check if PortNo is specified
    if($SqlInstanceForTsqlJobs -match "(?'SqlInstance'.+),(?'PortNo'\d+)") {
        $Port4SqlInstanceForTsqlJobs = $Matches['PortNo']
        $SqlInstanceForTsqlJobsWithOutPort = $Matches['SqlInstance']
    }
}

# Set $SqlInstanceForPowershellJobs same as $SqlInstanceToBaseline if NULL
$Port4SqlInstanceForPowershellJobs
if([String]::IsNullOrEmpty($SqlInstanceForPowershellJobs)) {
    $SqlInstanceForPowershellJobs = $SqlInstanceToBaseline
    $SqlInstanceForPowershellJobsWithOutPort = $SqlInstanceToBaselineWithOutPort
} else {
    # Check if PortNo is specified
    if($SqlInstanceForPowershellJobs -match "(?'SqlInstance'.+),(?'PortNo'\d+)") {
        $Port4SqlInstanceForPowershellJobs = $Matches['PortNo']
        $SqlInstanceForPowershellJobsWithOutPort = $Matches['SqlInstance']
    }
}

"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$DbaDatabase = [$DbaDatabase]" | Write-Host -ForegroundColor Yellow
"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$isUpgradeScenario = [$isUpgradeScenario]" | Write-Host -ForegroundColor Yellow
"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$SqlInstanceAsDataDestination = [$SqlInstanceAsDataDestination]"
if( (-not [String]::IsNullOrEmpty($Port4SqlInstanceAsDataDestination)) -and ($SqlInstanceToBaseline -ne $SqlInstanceAsDataDestination) ) {
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "SQL Port for [$SqlInstanceAsDataDestination] => $Port4SqlInstanceAsDataDestination." | Write-Host -ForegroundColor Yellow
}
"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$SqlInstanceForTsqlJobs = [$SqlInstanceForTsqlJobs]"
if( (-not [String]::IsNullOrEmpty($Port4SqlInstanceForTsqlJobs)) -and ($SqlInstanceToBaseline -ne $SqlInstanceForTsqlJobs) ) {
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "SQL Port for [$SqlInstanceForTsqlJobs] => $Port4SqlInstanceForTsqlJobs." | Write-Host -ForegroundColor Yellow
}
"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$SqlInstanceForPowershellJobs = [$SqlInstanceForPowershellJobs]"
if( (-not [String]::IsNullOrEmpty($Port4SqlInstanceForPowershellJobs)) -and ($SqlInstanceToBaseline -ne $SqlInstanceForPowershellJobs) ) {
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "SQL Port for [$SqlInstanceForPowershellJobs] => $Port4SqlInstanceForPowershellJobs." | Write-Host -ForegroundColor Yellow
}


# Create SQL Connections
if([String]::IsNullOrEmpty($SqlInstanceAsDataDestination) -or ($SqlInstanceAsDataDestination -eq $SqlInstanceToBaseline)) {
    $conSqlInstanceAsDataDestination = $conSqlInstanceToBaseline
} else {
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "[Connect-DbaInstance] Create connection for '$SqlInstanceAsDataDestination'.."
    $conSqlInstanceAsDataDestination = Connect-DbaInstance -SqlInstance $SqlInstanceAsDataDestination -Database master -ClientName "Wrapper-InstallSQLMonitor.ps1" `
                                                -SqlCredential $SqlCredential -TrustServerCertificate
}

if([String]::IsNullOrEmpty($SqlInstanceForTsqlJobs) -or ($SqlInstanceForTsqlJobs -eq $SqlInstanceToBaseline)) {
    $conSqlInstanceForTsqlJobs = $conSqlInstanceToBaseline
} else {
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "[Connect-DbaInstance] Create connection for '$SqlInstanceForTsqlJobs'.."
    $conSqlInstanceForTsqlJobs = Connect-DbaInstance -SqlInstance $SqlInstanceForTsqlJobs -Database master -ClientName "Wrapper-InstallSQLMonitor.ps1" `
                                                -SqlCredential $SqlCredential -TrustServerCertificate
}

if([String]::IsNullOrEmpty($SqlInstanceForPowershellJobs) -or ($SqlInstanceForPowershellJobs -eq $SqlInstanceToBaseline)) {
    $conSqlInstanceForPowershellJobs = $conSqlInstanceToBaseline
} else {
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "[Connect-DbaInstance] Create connection for '$SqlInstanceForPowershellJobs'.."
    $conSqlInstanceForPowershellJobs = Connect-DbaInstance -SqlInstance $SqlInstanceForPowershellJobs -Database master -ClientName "Wrapper-InstallSQLMonitor.ps1" `
                                                -SqlCredential $SqlCredential -TrustServerCertificate
}


# If Express edition, then ensure another server is mentioned for Creating jobs
"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Checking if [$SqlInstanceToBaseline] is Express Edition.."
$isExpressEdition = $false
if($dbServiceInfo.Edition -like 'Express*') {
    $isExpressEdition = $true
    if($ConfirmSetupOfTaskSchedulerJobs -eq $false) 
    {
        if( ($SqlInstanceForTsqlJobs -eq $SqlInstanceToBaseline) -or ($SqlInstanceForPowershellJobs -eq $SqlInstanceToBaseline) ) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Curent instance is Express edition." | Write-Host -ForegroundColor Red
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Option 01: Kindly provide a different SQLInstance for parameters SqlInstanceForTsqlJobs & SqlInstanceForPowershellJobs." | Write-Host -ForegroundColor Red
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Option 02: Using parameter ConfirmSetupOfTaskSchedulerJobs, kindly confirm for windows Task Scheduler based jobs." | Write-Host -ForegroundColor Red
            "STOP and check above error message" | Write-Error
        }
    }
    else {
        if([String]::IsNullOrEmpty($WindowsCredential)) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Curent instance is Express edition." | Write-Host -ForegroundColor Red
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "So, parameter WindowsCredential is must." | Write-Host -ForegroundColor Red
            "STOP and check above error message" | Write-Error
        }
    }
}


# Validate database collation
if(-not $SkipCollationCheck) 
{
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Validating Collation of databases.."
    $sqlDbCollation = @"
select name as [db_name], collation_name from sys.databases 
where collation_name not in ('SQL_Latin1_General_CP1_CI_AS') 
and name in ('master','msdb','tempdb','$DbaDatabase')
"@
    $dbCollationResult = @()
    $dbCollationResult += Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Query $sqlDbCollation -EnableException
    if($dbCollationResult.Count -ne 0) {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Collation of below databases is not [SQL_Latin1_General_CP1_CI_AS]." | Write-Host -ForegroundColor Red
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly rectify this collation problem, or Using SkipCollationCheck parameter." | Write-Host -ForegroundColor Red
        $dbCollationResult | Format-Table -AutoSize #| Write-Host -ForegroundColor Red
        Write-Error "Stop here. Fix above issue."
    }
}


# Get HostName for $SqlInstanceForPowershellJobs
if($SqlInstanceToBaseline -ne $SqlInstanceForPowershellJobs) 
{
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Fetching basic info for `$SqlInstanceForPowershellJobs => [$SqlInstanceForPowershellJobs].."
    try {
        $jobServerServicesInfo = Invoke-DbaQuery -SqlInstance $conSqlInstanceForPowershellJobs -Query $sqlServerInfo -EnableException
        $jobServerDbServiceInfo = $jobServerServicesInfo | Where-Object {$_.service_name_str -like "SQL Server (*)"}
        $jobServerAgentServiceInfo = $jobServerServicesInfo | Where-Object {$_.service_name_str -like "SQL Server Agent (*)"}
        $jobServerServicesInfo | Format-Table -AutoSize
    }
    catch {
        $errMessage = $_
    
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "SQL Connection to [$SqlInstanceToBaseline] failed."
        if([String]::IsNullOrEmpty($SqlCredential)) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly provide SqlCredentials." | Write-Host -ForegroundColor Red
        } else {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Provided SqlCredentials seems to be NOT working." | Write-Host -ForegroundColor Red
        }
        Write-Error "Stop here. Fix above issue."
    }
}
else {
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$SqlInstanceToBaseline ~ `$SqlInstanceForPowershellJobs.."
    $jobServerServicesInfo = $resultServerInfo
    $jobServerDbServiceInfo = $dbServiceInfo
    $jobServerAgentServiceInfo = $agentServiceInfo
}

# Setup PSSession on $SqlInstanceForPowershellJobs
"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Validating if PSSession is needed on `$SqlInstanceForPowershellJobs.."
if( (-not $SkipRDPSessionSteps) -and ($HostName -ne $jobServerDbServiceInfo.host_name) )
{
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Create PSSession for host [$($jobServerDbServiceInfo.host_name)].."
    $ssnHostName = $jobServerDbServiceInfo.host_name #+'.'+$jobServerDbServiceInfo.domain_reg

    # Try reaching server using HostName provided/detected, if fails, then use FQDN
    if (-not (Test-Connection -ComputerName $ssnHostName -Quiet -Count 1)) {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "Host [$ssnHostName] not pingable. So trying FQDN form.."
        $ssnHostName = $ssnHostName+'.'+$jobServerDbServiceInfo.domain_reg
    }

    # Try reaching using FQDN, if fails & not a clustered instance, then use SqlInstanceToBaseline itself
    if (-not (Test-Connection -ComputerName $ssnHostName -Quiet -Count 1)) {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "Host [$ssnHostName] not pingable. So trying `$SqlInstanceForPowershellJobs parameter value itself.."
        $ssnHostName = $SqlInstanceForPowershellJobs
    }

    # Try reaching using FQDN, if fails & not a clustered instance, then use SqlInstanceToBaseline itself
    if ( -not (Test-Connection -ComputerName $ssnHostName -Quiet -Count 1) ) {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Host [$ssnHostName] not pingable." | Write-Host -ForegroundColor Red
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly ensure pssession is working for `$SqlInstanceForPowershellJobs [$SqlInstanceForPowershellJobs]." | Write-Host -ForegroundColor Red
        "STOP and check above error message" | Write-Error
    }

    $ssnJobServer = $null
    $errVariables = @()

    # First Attempt without Any credentials
    try {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Trying for PSSession on [$ssnHostName] normally.."
            $ssnJobServer = New-PSSession -ComputerName $ssnHostName 
        }
    catch { $errVariables += $_ }

    # Second Attempt for Trusted Cross Domains
    if( [String]::IsNullOrEmpty($ssnJobServer) ) {
        try { 
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Trying for PSSession on [$ssnHostName] assuming cross domain.."
            $ssnJobServer = New-PSSession -ComputerName $ssnHostName -Authentication Negotiate 
        }
        catch { $errVariables += $_ }
    }

    # 3rd Attempt with Credentials
    if( [String]::IsNullOrEmpty($ssnJobServer) -and (-not [String]::IsNullOrEmpty($WindowsCredential)) ) {
        try {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Trying PSSession for [$ssnHostName] using provided WindowsCredentials.."
            $ssnJobServer = New-PSSession -ComputerName $ssnHostName -Credential $WindowsCredential    
        }
        catch { $errVariables += $_ }

        if( [String]::IsNullOrEmpty($ssn) ) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Trying PSSession for [$ssnHostName] using provided WindowsCredentials with Negotiate attribute.."
            $ssnJobServer = New-PSSession -ComputerName $ssnHostName -Credential $WindowsCredential -Authentication Negotiate
        }
    }

    if ( [String]::IsNullOrEmpty($ssnJobServer) ) {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Provide WindowsCredential for accessing server [$ssnHostName] of domain '$($sqlServerInfo.domain)'." | Write-Host -ForegroundColor Red
        "STOP here, and fix above issue." | Write-Error
    }

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "PSSession for [$($jobServerDbServiceInfo.host_name)].."
    $ssnJobServer
}
else {
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$ssnJobServer is same as `$ssn4PerfmonSetup."
    $ssnJobServer = $ssn4PerfmonSetup
}


# Service Account and Access Validation
$requireProxy = $false
if( ($SkipPowerShellJobs -or $SkipAllJobs) -and ($SkipWindowsAdminAccessTest -eq $false) -and ('21__CreateJobRemoveXEventFiles' -notin $Steps2Execute) ) { $SkipWindowsAdminAccessTest = $true }
if($SkipWindowsAdminAccessTest -eq $false)
{
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Validate for WindowsCredential if SQL Service Accounts are non-priviledged.."

    # If Express edition, and Task scheduler jobs are required
    if( (-not [String]::IsNullOrEmpty($WindowsCredential)) -and ($isExpressEdition) -and ($ConfirmSetupOfTaskSchedulerJobs) )
    {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$WindowsCredential = '$($WindowsCredential.UserName)'"
        $adminAccessTestScript = {
                $AdminName = Get-LocalUser | Where-Object {$_.Name -like 'Admin*' -and $_.Enabled} | Select-Object -ExpandProperty Name -First 1
                Get-ChildItem "C:\Users\$AdminName" -ErrorAction Stop | Out-Null
            }
        Invoke-Command -Session $ssn4PerfmonSetup -ScriptBlock $adminAccessTestScript -ErrorAction Stop
    }
    else # If not express edition
    {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$TestWindowsAdminAccessJobFilePath = '$TestWindowsAdminAccessJobFilePath'"
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating & executing job [(dba) Test-WindowsAdminAccess] on [$SqlInstanceForPowershellJobs].."
        $sqlTestWindowsAdminAccessFilePath = [System.IO.File]::ReadAllText($TestWindowsAdminAccessJobFilePath)
        Invoke-DbaQuery -SqlInstance $conSqlInstanceForPowershellJobs -Database msdb -Query $sqlTestWindowsAdminAccessFilePath -EnableException

        $testWindowsAdminAccessJobHistory = @()
        $loopStartTime = Get-Date
        $sleepDurationSeconds = 5
        $loopTotalDurationThresholdSeconds = 300    
    
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Fetching execution history for job [(dba) Test-WindowsAdminAccess] on [$SqlInstanceForPowershellJobs].."
        while ($testWindowsAdminAccessJobHistory.Count -eq 0 -and $( (New-TimeSpan $loopStartTime $(Get-Date)).TotalSeconds -le $loopTotalDurationThresholdSeconds ) )
        {
            $testWindowsAdminAccessJobHistory += Get-DbaAgentJobHistory -SqlInstance $conSqlInstanceForPowershellJobs -Job '(dba) Test-WindowsAdminAccess' `
                                                        -ExcludeJobSteps -EnableException

            if($testWindowsAdminAccessJobHistory.Count -eq 0) {
                "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Wait for $sleepDurationSeconds seconds as the job might be running.."
                Start-Sleep -Seconds $sleepDurationSeconds
            }
        }

        if($testWindowsAdminAccessJobHistory.Count -eq 0) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Status of job [(dba) Test-WindowsAdminAccess] on [$SqlInstanceForPowershellJobs] could not be fetched on time. Kindly validate." | Write-Host -ForegroundColor Red
            "STOP and check above error message" | Write-Error
        }
        else {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "[(dba) Test-WindowsAdminAccess] Job history => '$($testWindowsAdminAccessJobHistory.Message)'."
            $testWindowsAdminAccessJobHistory | Format-Table -AutoSize
        }

        $hasWindowsAdminAccess = $false
        $sqlServerAgentInfo = if($SqlInstanceForPowershellJobs -ne $SqlInstanceToBaseline) {$jobServerAgentServiceInfo} else {$agentServiceInfo}

        if($testWindowsAdminAccessJobHistory.Status -ne 'Succeeded') {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "SQL Agent service account [$($sqlServerAgentInfo.service_account)] DO NOT have admin access at windows."
        } else {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "SQL Agent service account [$($sqlServerAgentInfo.service_account)] has admin access at windows."
            $hasWindowsAdminAccess = $true
        }

        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Remove test job [(dba) Test-WindowsAdminAccess].."
        Invoke-DbaQuery -SqlInstance $conSqlInstanceForPowershellJobs -Database msdb -Query "EXEC msdb.dbo.sp_delete_job @job_name=N'(dba) Test-WindowsAdminAccess'" -EnableException


        $requireProxy = $(-not $hasWindowsAdminAccess)
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$hasWindowsAdminAccess = $hasWindowsAdminAccess"
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$requireProxy = $requireProxy"

        if($requireProxy -and [String]::IsNullOrEmpty($WindowsCredential)) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly provide WindowsCredential to create SQL Agent Job Proxy." | Write-Host -ForegroundColor Red
            "STOP and check above error message" | Write-Error
        }
    }
}
else {
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "Since SkipWindowsAdminAccessTest is set to TRUE, assuming `$requireProxy to $requireProxy."
}


# Validate mail profile
if(-not $SkipMailProfileCheck)
{
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Checking for default global mail profile.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$MailProfileFilePath = '$MailProfileFilePath'"
    $sqlMailProfile = @"
SELECT p.name as profile_name, p.description as profile_description, a.name as mail_account, 
		a.email_address, a.display_name, a.replyto_address, s.servername, s.port, s.servername,
		pp.is_default
FROM msdb.dbo.sysmail_profile p 
JOIN msdb.dbo.sysmail_principalprofile pp ON pp.profile_id = p.profile_id AND pp.is_default = 1
JOIN msdb.dbo.sysmail_profileaccount pa ON p.profile_id = pa.profile_id 
JOIN msdb.dbo.sysmail_account a ON pa.account_id = a.account_id 
JOIN msdb.dbo.sysmail_server s ON a.account_id = s.account_id
WHERE pp.is_default = 1
"@
    $mailProfile = @()
    $mailProfile += Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database msdb -Query $sqlMailProfile -EnableException
    if($mailProfile.Count -lt 1) {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Kindly create default global mail profile." | Write-Host -ForegroundColor Red
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Kindly utilize '$mailProfileFilePath." | Write-Host -ForegroundColor Red
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Opening the file '$mailProfileFilePath' in notepad.." | Write-Host -ForegroundColor Red
        notepad "$mailProfileFilePath"

        $mailProfile += Get-DbaDbMailProfile -SqlInstance $conSqlInstanceToBaseline
        if($mailProfile.Count -ne 0) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Below mail profile(s) exists.`nOne of them can be set to default global profile." | Write-Host -ForegroundColor Red
            $mailProfile | Format-Table -AutoSize
        }

        Write-Error "Stop here. Fix above issue."
    }
}


# Fetch DBA Database File Path
"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Fetch [$DbaDatabase] path.."
if($SkipDriveCheck) {
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "Skip validation of C:\ drive check.." | Write-Host -ForegroundColor Cyan
}
$sqlDbaDatabasePath = @"
select top 1 physical_name FROM sys.master_files 
where database_id = DB_ID('$DbaDatabase') and type_desc = 'ROWS' 
$(if($SkipDriveCheck){'--'})and physical_name not like 'C:\%' 
order by file_id;
"@
$resultDbaDatabasePath = @()
$resultDbaDatabasePath += Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database master -Query $sqlDbaDatabasePath -EnableException
if($resultDbaDatabasePath.Count -eq 0) {
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Seems either [$DbaDatabase] does not exists, or the data/log files are present in C:\ drive. `n`t Kindly rectify this issue." | Write-Host -ForegroundColor Red
    Write-Error "Stop here. Fix above issue."
}
else {
    $dbaDatabasePath = $resultDbaDatabasePath[0].physical_name
}
"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$dbaDatabasePath => '$dbaDatabasePath'.."


# Execute PreQuery
if(-not [String]::IsNullOrEmpty($PreQuery)) {
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Executing PreQuery on [$SqlInstanceToBaseline].." | Write-Host -ForegroundColor Cyan
    Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -Query $PreQuery -EnableException
}


# If Express edition, and Task scheduler jobs are required
if( ((-not [String]::IsNullOrEmpty($WindowsCredential)) -or ($ssnHostName -eq $env:COMPUTERNAME)) `
    -and ($isExpressEdition -or $ForceSetupOfTaskSchedulerJobs) -and ($ConfirmSetupOfTaskSchedulerJobs -or $ForceSetupOfTaskSchedulerJobs) )
{
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Ensuring Logs folder on remote server path '$logsPath'.."

    $createFolderScript = {
            Param ($logsPath)
            New-Item $logsPath -ItemType Directory -Force | Out-Null
        }
    Invoke-Command -Session $ssn4PerfmonSetup -ScriptBlock $createFolderScript -ArgumentList @($logsPath) -ErrorAction Stop
}


# 1__sp_WhoIsActive
$stepName = '1__sp_WhoIsActive'
if($stepName -in $Steps2Execute) {
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$WhoIsActiveFilePath = '$WhoIsActiveFilePath'"
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating sp_WhoIsActive in [master] database.."
    Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database master -File $WhoIsActiveFilePath -EnableException

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Checking if sp_WhoIsActive is present in [$DbaDatabase] also.."
    $sqlCheckWhoIsActiveExistence = "select [is_existing] = case when OBJECT_ID('dbo.sp_WhoIsActive') is null then 0 else 1 end;"
    $existsWhoIsActive = Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -Query $sqlCheckWhoIsActiveExistence -EnableException | Select-Object -ExpandProperty is_existing;
    if($existsWhoIsActive -eq 1) {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Update sp_WhoIsActive definition in [$DbaDatabase] also.."
        Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -File $WhoIsActiveFilePath -EnableException
    }
}


# 2__AllDatabaseObjects
$stepName = '2__AllDatabaseObjects'
if($stepName -in $Steps2Execute)
{
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating All Objects in [$DbaDatabase] database.."

    # Retrieve actual content & dump in temporary file
    $tempAllDatabaseObjectsFileName = "$($AllDatabaseObjectsFileName -replace '.sql','')-RuntimeUsedFile.sql"
    $tempAllDatabaseObjectsFilePath = Join-Path $ddlPath $tempAllDatabaseObjectsFileName

    $AllDatabaseObjectsFileContent = [System.IO.File]::ReadAllText($AllDatabaseObjectsFilePath)

    # MultiServerViews ~ [vw_performance_counters],[vw_disk_space],[vw_os_task_list]
    if($SkipMultiServerviewsUpgrade -eq $true) {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "MultiServerViews are being skipped for upgrade."
        $AllDatabaseObjectsFileContent = $AllDatabaseObjectsFileContent.Replace("declare @recreate_multi_server_views bit = 1;", "declare @recreate_multi_server_views bit = 0;")
    }
    else {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "MultiServerViews are considered for upgrade."
    }

    # Modify content if SQL Server does not support Partitioning
    if($IsNonPartitioned) {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Partitioning is not supported on current server."

        $AllDatabaseObjectsFileContent = $AllDatabaseObjectsFileContent.Replace('declare @is_partitioned bit = 1;', 'declare @is_partitioned bit = 0;')
        $AllDatabaseObjectsFileContent = $AllDatabaseObjectsFileContent.Replace(' on ps_dba', ' --on ps_dba')
    }

    $AllDatabaseObjectsFileContent | Out-File -FilePath $tempAllDatabaseObjectsFilePath
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Runtime All Server Objects file code is generated."

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$AllDatabaseObjectsFilePath = '$tempAllDatabaseObjectsFilePath'"
    try {
        Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -File $tempAllDatabaseObjectsFilePath -EnableException
    }
    catch {
        $errMessage = $_

        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Below error occurred while trying to execute script '$tempAllDatabaseObjectsFilePath'." | Write-Host -ForegroundColor Red
        $($errMessage.Exception.Message -Split [Environment]::NewLine) | % {"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "$_"} | Write-Host -ForegroundColor Red

        Write-Error "Stop here. Fix above issue."
    }

    # Cleanup temporary file path
    if($true) {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Remove temp file '$tempAllDatabaseObjectsFilePath'.."
        Remove-Item -Path $tempAllDatabaseObjectsFilePath | Out-Null
    }

    # Update InventoryServer Objects
    if($InventoryServer -eq $SqlInstanceToBaseline)
    {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Update objects on Inventory Server.."
        $InventorySpecificObjectsFileText = [System.IO.File]::ReadAllText($InventorySpecificObjectsFilePath)
        $dbaDatabaseParentPath = Split-Path $dbaDatabasePath -Parent
        $memoryOptimizedFilePath = if($dbaDatabaseParentPath -notmatch '\\$') { "$dbaDatabaseParentPath\MemoryOptimized.ndf" } else { "$($dabaDatabaseParentPath)MemoryOptimized.ndf" }
        #$InventorySpecificObjectsFileText = $InventorySpecificObjectsFileText.Replace('E:\Data\MemoryOptimized.ndf', "$(Join-Path $dbaDatabaseParentPath 'MemoryOptimized.ndf')")
        $InventorySpecificObjectsFileText = $InventorySpecificObjectsFileText.Replace('E:\Data\MemoryOptimized.ndf', $memoryOptimizedFilePath)
        Invoke-DbaQuery -SqlInstance $conInventoryServer -Database $InventoryDatabase -Query $InventorySpecificObjectsFileText -EnableException
    }

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$UspCollectWaitStatsFilePath = '$UspCollectWaitStatsFilePath'"
    Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -File $UspCollectWaitStatsFilePath -EnableException

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$UspCollectXeventsResourceConsumptionFilePath = '$UspCollectXeventsResourceConsumptionFilePath'"
    Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -File $UspCollectXeventsResourceConsumptionFilePath -EnableException

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$UspPartitionMaintenanceFilePath = '$UspPartitionMaintenanceFilePath'"
    Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -File $UspPartitionMaintenanceFilePath -EnableException

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$UspPurgeTablesFilePath = '$UspPurgeTablesFilePath'"
    Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -File $UspPurgeTablesFilePath -EnableException

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$UspActiveRequestsCountFilePath = '$UspActiveRequestsCountFilePath'"
    Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -File $UspActiveRequestsCountFilePath -EnableException

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$UspWaitsPerCorePerMinuteFilePath = '$UspWaitsPerCorePerMinuteFilePath'"
    Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -File $UspWaitsPerCorePerMinuteFilePath -EnableException

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$UspEnablePageCompressionFilePath = '$UspEnablePageCompressionFilePath'"
    Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -File $UspEnablePageCompressionFilePath -EnableException

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$UspRunWhoIsActiveFilePath = '$UspRunWhoIsActiveFilePath'"
    Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -File $UspRunWhoIsActiveFilePath -EnableException

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$UspCollectFileIOStatsFilePath = '$UspCollectFileIOStatsFilePath'"
    Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -File $UspCollectFileIOStatsFilePath -EnableException

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$UspCollectMemoryClerksFilePath = '$UspCollectMemoryClerksFilePath'"
    Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -File $UspCollectMemoryClerksFilePath -EnableException

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$UspCheckSQLAgentJobsFilePath = '$UspCheckSQLAgentJobsFilePath'"
    Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -File $UspCheckSQLAgentJobsFilePath -EnableException

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Adding entry into [$SqlInstanceToBaseline].[$DbaDatabase].[dbo].[instance_hosts].."
    $sqlAddInstanceHost = @"
        if not exists (select * from dbo.instance_hosts where host_name = '$HostName')
        begin
	        insert dbo.instance_hosts ([host_name])
	        select [host_name] = '$HostName';
            
            select 'dbo.instance_hosts' as RunningQuery, * from dbo.instance_hosts where [host_name] = '$HostName';
        end
"@
    # Populate $SqlInstanceToBaseline
    Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -Query $sqlAddInstanceHost -EnableException | ft -AutoSize

    # Populate $SqlInstanceAsDataDestination
    if( ($SqlInstanceAsDataDestination -ne $SqlInstanceToBaseline) -and ($InventoryServer -ne $SqlInstanceAsDataDestination) ) {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Adding entry into [$SqlInstanceAsDataDestination].[$DbaDatabase].[dbo].[instance_hosts].."
        Invoke-DbaQuery -SqlInstance $conSqlInstanceAsDataDestination -Database $DbaDatabase -Query $sqlAddInstanceHost -EnableException | ft -AutoSize
    }

    # Populate $InventoryServer
    if($InventoryServer -ne $SqlInstanceToBaseline) {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Adding entry into [$InventoryServer].[$InventoryDatabase].[dbo].[instance_hosts].."
        Invoke-DbaQuery -SqlInstance $conInventoryServer -Database $InventoryDatabase -Query $sqlAddInstanceHost -EnableException | ft -AutoSize
    }    


    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Adding entry into [$SqlInstanceToBaseline].[$DbaDatabase].[dbo].[instance_details].."
    $sqlAddInstanceHostMapping = @"
    if not exists (select * from dbo.instance_details where sql_instance = '$SqlInstanceToBaselineWithOutPort' and [host_name] = '$HostName')
    begin
	    insert dbo.instance_details 
            (   [sql_instance], [sql_instance_port], [host_name], [database], [collector_tsql_jobs_server], 
                [collector_powershell_jobs_server], [data_destination_sql_instance],
                [dba_group_mail_id], [sqlmonitor_script_path]
            )
	    select	[sql_instance] = '$SqlInstanceToBaselineWithOutPort',
                [sql_instance_port] = $(if([String]::IsNullOrEmpty($Port4SqlInstanceToBaseline)){'null'}else{"'$Port4SqlInstanceToBaseline'"}),
			    [host_name] = '$Hostname',
                [database] = '$DbaDatabase',
			    [collector_tsql_jobs_server] = '$SqlInstanceForTsqlJobs',
                [collector_powershell_jobs_server] = '$SqlInstanceForPowershellJobs',
                [data_destination_sql_instance] = '$SqlInstanceAsDataDestination',
                [dba_group_mail_id] = '$($DbaGroupMailId -join ';')',
			    [sqlmonitor_script_path] = '$RemoteSQLMonitorPath'

        select 'dbo.instance_details' as RunningQuery, * from dbo.instance_details where [sql_instance] = '$SqlInstanceToBaselineWithOutPort';
    end
"@
    
    # Populate $SqlInstanceToBaseline
    Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -Query $sqlAddInstanceHostMapping -EnableException | ft -AutoSize

    # Populate $SqlInstanceAsDataDestination
    if( ($SqlInstanceAsDataDestination -ne $SqlInstanceToBaseline) -and ($InventoryServer -ne $SqlInstanceAsDataDestination) ) {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Adding entry into [$SqlInstanceAsDataDestination].[$DbaDatabase].[dbo].[instance_details].."
        Invoke-DbaQuery -SqlInstance $conSqlInstanceAsDataDestination -Database $DbaDatabase -Query $sqlAddInstanceHostMapping -EnableException | ft -AutoSize
    }

    # Populate $InventoryServer
    if($InventoryServer -ne $SqlInstanceToBaseline) {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Adding entry into [$InventoryServer].[$InventoryDatabase].[dbo].[instance_details].."
        Invoke-DbaQuery -SqlInstance $conInventoryServer -Database $InventoryDatabase -Query $sqlAddInstanceHostMapping -EnableException | ft -AutoSize
    }

    if($isExpressEdition -or (-not [String]::IsNullOrEmpty($RetentionDays)) ) 
    {
        if($isExpressEdition -and ([String]::IsNullOrEmpty($RetentionDays) -or $RetentionDays -gt 7) ) {
            $RetentionDays = 7
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Since Express Edition, setting retention to $RetentionDays days.." | Write-Host -ForegroundColor Cyan
        }
        else {
            if([String]::IsNullOrEmpty($RetentionDays) -or $RetentionDays -eq 0) {
                $RetentionDays = 14
            }
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Setting retention to $RetentionDays days.." | Write-Host -ForegroundColor Cyan
        }
        
        # Update retention only when table is recently added. For already existing tables, retention should be modified manually
        $sqlSetPurgeThreshold = @"
update dbo.purge_table 
set retention_days = case when table_name like 'dbo.BlitzIndex%' then $RetentionDays*6 
                            when table_name = 'dbo.disk_space' then  $RetentionDays*6 
                            when table_name = 'dbo.file_io_stats' then  $RetentionDays*6 
                            when table_name = 'dbo.memory_clerks' then  $RetentionDays*6 
                            when table_name = 'dbo.wait_stats' then  $RetentionDays*6 
                            when table_name = 'dbo.resource_consumption' then  $RetentionDays*6
                            else $RetentionDays
                            end
where 1=1
--and retention_days > $RetentionDays
and created_date >= DATEADD(hour,-2,getdate())
"@
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$sqlSetPurgeThreshold => `n`n`t$sqlSetPurgeThreshold"
        Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -Query $sqlSetPurgeThreshold -EnableException
    }
}

# Save additional settings in [$InventoryServer].[$InventoryDatabase].[dbo].[instance_details].[more_info] as JSON
if( ($ForceSetupOfTaskSchedulerJobs -or $HasCustomizedTsqlJobs -or $HasCustomizedPowerShellJobs) `
    -and ($isUpgradeScenario -or ($Steps2Execute -contains '2__AllDatabaseObjects'))
  )
{
    $moreInfo = New-Object psobject -Property @{
        ForceSetupOfTaskSchedulerJobs = $ForceSetupOfTaskSchedulerJobs
        HasCustomizedTsqlJobs = $HasCustomizedTsqlJobs
        HasCustomizedPowerShellJobs = $HasCustomizedPowerShellJobs
    }
    $moreInfoJSON = $moreInfo | ConvertTo-Json


    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Adding [more_info] into [$SqlInstanceToBaseline].[$DbaDatabase].[dbo].[instance_details].."
    $sqlAddMoreInfo = @"
    update id
    set more_info = '$moreInfoJSON'
    --select * 
    from dbo.instance_details id
    where sql_instance = '$SqlInstanceToBaselineWithOutPort' and [host_name] = '$HostName'
"@
    Invoke-DbaQuery -SqlInstance $conInventoryServer -Database $InventoryDatabase -Query $sqlAddMoreInfo -EnableException | ft -AutoSize
}

[System.Collections.ArrayList]$newList = $Steps2Execute
if($HasCustomizedTsqlJobs) {
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "*****Based on `$HasCustomizedTsqlJobs, skipping TSQL Jobs.." | Write-Host -ForegroundColor Yellow
    foreach($tsqJobStepName in $TsqlJobSteps) {
        $newList.Remove($tsqJobStepName) | Out-Null
    }
}
if($HasCustomizedPowerShellJobs) {
    "$(if(-not $HasCustomizedTsqlJobs){"`n"})$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}`n" -f 'WARNING:', "*****Based on `$HasCustomizedPowerShellJobs, skipping PowerShell Jobs.." | Write-Host -ForegroundColor Yellow
    foreach($psJobStepName in $PowerShellJobSteps) {
        $newList.Remove($psJobStepName) | Out-Null
    }
}
$Steps2Execute = $newList


# 3__XEventSession
$stepName = '3__XEventSession'
if( ($stepName -in $Steps2Execute) -and ($MajorVersion -ge 11) ) {
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$XEventSessionFilePath = '$XEventSessionFilePath'"

    $dbaDatabasePathParent = Split-Path $dbaDatabasePath -Parent
    if($dbaDatabasePathParent.Length -eq 3) {
        $xEventTargetPathDirectory = "${dbaDatabasePathParent}xevents"
    }
    else {
        $xEventTargetPathDirectoryParent = Split-Path $dbaDatabasePathParent -Parent
        if($xEventTargetPathDirectoryParent.Length -eq 3) {
            $xEventTargetPathDirectory = "$(Split-Path $dbaDatabasePathParent -Parent)xevents"
        }
        else {
            $xEventTargetPathDirectory = "$($xEventTargetPathDirectoryParent)\xevents"
        }
    }

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Computed XEvent files directory -> '$xEventTargetPathDirectory'.."
    if(-not (Test-Path $($xEventTargetPathDirectory))) {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Create directory '$xEventTargetPathDirectory' for XEvent files.."
        Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -Query "EXEC xp_create_subdir '$xEventTargetPathDirectory'" -EnableException
    }

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Create XEvent session named [resource_consumption].."
    $sqlXEventSession = [System.IO.File]::ReadAllText($XEventSessionFilePath).Replace('E:\Data\xevents', "$xEventTargetPathDirectory")
    try {
        Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database master -Query $sqlXEventSession -EnableException | Format-Table -AutoSize
    }
    catch {
        $errMessage = $_
        $errMessage | gm
        if($errMessage.Exception.Message -like "The value specified for event attribute or predicate source*") {
            $sqlXEventSession = $sqlXEventSession.Replace("WHERE ( ([duration]>=5000000) OR ([result]<>('OK')) ))", "WHERE ( ([duration]>=5000000) ))")
        }
        Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database master -Query $sqlXEventSession -EnableException | Format-Table -AutoSize
    }
}


# 4__FirstResponderKitObjects
$stepName = '4__FirstResponderKitObjects'
if($stepName -in $Steps2Execute) {
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating FirstResponderKit Objects in [master] database.."
    if([String]::IsNullOrEmpty($FirstResponderKitZipFile)) {
        Install-DbaFirstResponderKit -SqlInstance $conSqlInstanceToBaseline -Database master -EnableException -Verbose:$false -Debug:$false | Format-Table -AutoSize
    }
    else {
        Install-DbaFirstResponderKit -SqlInstance $conSqlInstanceToBaseline -Database master -LocalFile $FirstResponderKitZipFile -EnableException -Verbose:$false -Debug:$false | Format-Table -AutoSize
    }
}


# 5__DarlingDataObjects
$stepName = '5__DarlingDataObjects'
if($stepName -in $Steps2Execute) {
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating DarlingData Objects in [master] database.."
    if([String]::IsNullOrEmpty($DarlingDataZipFile)) {
        Install-DbaDarlingData -SqlInstance $conSqlInstanceToBaseline -Database master -EnableException | Format-Table -AutoSize
    }
    else {
        Install-DbaDarlingData -SqlInstance $conSqlInstanceToBaseline -Database master -LocalFile $DarlingDataZipFile -EnableException | Format-Table -AutoSize
    }
}


# 6__OlaHallengrenSolutionObjects
$stepName = '6__OlaHallengrenSolutionObjects'
if( ($stepName -in $Steps2Execute) -and ([String]::IsNullOrEmpty($OlaHallengrenSolutionZipFile) -eq $false) )  {
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating objects of Ola Hallengren Maintenance Solution except jobs in [$DbaDatabase] database.."
    
    Install-DbaMaintenanceSolution -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -ReplaceExisting -LocalFile $OlaHallengrenSolutionZipFile -EnableException | Out-Null
}


# 7__sp_WhatIsRunning
$stepName = '7__sp_WhatIsRunning'
if($stepName -in $Steps2Execute) {
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$WhatIsRunningFilePath = '$WhatIsRunningFilePath'"
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating sp_WhatIsRunning procedure in [$DbaDatabase] database.."
    if($MajorVersion -ge 11) {
        Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -File $WhatIsRunningFilePath -EnableException | Format-Table -AutoSize
    }
    else {
        $sqlWhatIsRunning = [System.IO.File]::ReadAllText($WhatIsRunningFilePath)        
        $sqlWhatIsRunning = $sqlWhatIsRunning.Replace('open_transaction_count = s.open_transaction_count', "open_transaction_count = 0")
        $sqlWhatIsRunning = $sqlWhatIsRunning.Replace('s.database_id', "null")

        Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -Query $sqlWhatIsRunning -EnableException
    }
}


# 8__usp_GetAllServerInfo
$stepName = '8__usp_GetAllServerInfo'
if($stepName -in $Steps2Execute -and $SqlInstanceToBaseline -eq $InventoryServer) {
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$GetAllServerInfoFilePath = '$GetAllServerInfoFilePath'"
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating usp_GetAllServerInfo procedure in [$DbaDatabase] database.."
    Invoke-DbaQuery -SqlInstance $conInventoryServer -Database $InventoryDatabase -File $GetAllServerInfoFilePath

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$UspWrapperGetAllServerInfoFilePath = '$UspWrapperGetAllServerInfoFilePath'"
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating usp_wrapper_GetAllServerInfo procedure in [$DbaDatabase] database.."
    Invoke-DbaQuery -SqlInstance $conInventoryServer -Database $InventoryDatabase -File $UspWrapperGetAllServerInfoFilePath
}


# 9__CopyDbaToolsModule2Host
$stepName = '9__CopyDbaToolsModule2Host'
if($stepName -in $Steps2Execute) {
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$DbaToolsFolderPath = '$DbaToolsFolderPath'"
    
    # Copy dbatools on HostName provided
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Finding valid PSModule path on [$HostName].."
    $remoteModulePath = Invoke-Command -Session $ssn4PerfmonSetup -ScriptBlock {
        $modulePath = $null
        if('C:\Program Files\WindowsPowerShell\Modules' -in $($env:PSModulePath -split ';')) {
            $modulePath = 'C:\Program Files\WindowsPowerShell\Modules'
        }
        else {
            $modulePath = $($env:PSModulePath -split ';') | Where-Object {$_ -like '*Microsoft SQL Server*'} | select -First 1
        }
        $modulePath
    }

    $dbatoolsRemotePath = Join-Path $remoteModulePath 'dbatools'
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Copy dbatools module from '$DbaToolsFolderPath' to host [$HostName] on '$dbatoolsRemotePath'.."
    
    if( (Invoke-Command -Session $ssn4PerfmonSetup -ScriptBlock {Test-Path $Using:dbatoolsRemotePath}) ) {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "'$dbatoolsRemotePath' already exists on host [$HostName]."
    }
    else {
        Copy-Item $DbaToolsFolderPath -Destination $dbatoolsRemotePath -ToSession $ssn4PerfmonSetup -Recurse
    }

    # Copy dbatools folder on Jobs Server Host
    if( ($SqlInstanceToBaseline -ne $SqlInstanceForPowershellJobs) -and ($ssn4PerfmonSetup -ne $ssnJobServer) )
    {
        "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Finding valid PSModule path on [$($ssnJobServer.ComputerName)].."
        $remoteModulePath = Invoke-Command -Session $ssnJobServer -ScriptBlock {
            $modulePath = $null
            if('C:\Program Files\WindowsPowerShell\Modules' -in $($env:PSModulePath -split ';')) {
                $modulePath = 'C:\Program Files\WindowsPowerShell\Modules'
            }
            else {
                $modulePath = $($env:PSModulePath -split ';') | Where-Object {$_ -like '*Microsoft SQL Server*'} | select -First 1
            }
            $modulePath
        }

        $dbatoolsRemotePath = Join-Path $remoteModulePath 'dbatools'
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Copy dbatools module from '$DbaToolsFolderPath' to host [$($ssnJobServer.ComputerName)] on '$dbatoolsRemotePath'.."
    
        if( (Invoke-Command -Session $ssnJobServer -ScriptBlock {Test-Path $Using:dbatoolsRemotePath}) ) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "'$dbatoolsRemotePath' already exists on host [$($ssnJobServer.ComputerName)]."
        }
        else {
            Copy-Item $DbaToolsFolderPath -Destination $dbatoolsRemotePath -ToSession $ssnJobServer -Recurse
        }
    }
}


# 10__CopyPerfmonFolder2Host
$stepName = '10__CopyPerfmonFolder2Host'
if($stepName -in $Steps2Execute) {
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$psScriptPath = '$psScriptPath'"
    
    # Copy SQLMonitor folder on HostName provided
    if( (Invoke-Command -Session $ssn4PerfmonSetup -ScriptBlock {Test-Path $Using:RemoteSQLMonitorPath}) ) {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Sync '$RemoteSQLMonitorPath' on [$HostName] from local copy '$psScriptPath'.."
        Copy-Item "$psScriptPath\*" -Destination "$RemoteSQLMonitorPath" -ToSession $ssn4PerfmonSetup -Exclude "*.blg" -Recurse -Force
    }else {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Copy '$psScriptPath' to '$RemoteSQLMonitorPath' on [$HostName].."
        Copy-Item $psScriptPath -Destination $RemoteSQLMonitorPath -ToSession $ssn4PerfmonSetup -Exclude "*.blg" -Recurse -Force
    }

    # Copy SQLMonitor folder on Jobs Server Host
    if( ($SqlInstanceToBaseline -ne $SqlInstanceForPowershellJobs) -and ($ssn4PerfmonSetup -ne $ssnJobServer) )
    {
        if( (Invoke-Command -Session $ssn4PerfmonSetup -ScriptBlock {Test-Path $Using:RemoteSQLMonitorPath}) ) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Sync '$RemoteSQLMonitorPath' on [$HostName] from local copy '$psScriptPath'.."
            Copy-Item "$psScriptPath\*" -Destination "$RemoteSQLMonitorPath" -ToSession $ssn4PerfmonSetup -Exclude "*.blg" -Recurse -Force
        }else {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Copy '$psScriptPath' to '$RemoteSQLMonitorPath' on [$HostName].."
            Copy-Item $psScriptPath -Destination $RemoteSQLMonitorPath -ToSession $ssn4PerfmonSetup -Exclude "*.blg" -Recurse -Force
        }
    }
}


# 11__SetupPerfmonDataCollector
$stepName = '11__SetupPerfmonDataCollector'
if($stepName -in $Steps2Execute) {
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Setup Data Collector set 'DBA' on host '$HostName'.."
    Invoke-Command -Session $ssn4PerfmonSetup -ScriptBlock {
        # Set execution policy
        Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy Unrestricted -Force 
        & "$Using:RemoteSQLMonitorPath\perfmon-collector-logman.ps1" -TemplatePath "$Using:RemoteSQLMonitorPath\DBA_PerfMon_All_Counters_Template.xml" -ReSetupCollector $true
    }
}

# If non-domain server, then added HostName in credential name
"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Add hostname in Credential name if non-domain server.."
if(-not [String]::IsNullOrEmpty($WindowsCredential))
{
    if( $domain -in @('WORKGROUP','WORKGROUP.com') -and (-not $WindowsCredential.UserName.Contains('\')) ) {
        $credentialName = "$HostName\$($WindowsCredential.UserName)"
    }
    else {
        $credentialName = $WindowsCredential.UserName
    }
    $credentialPassword = $WindowsCredential.Password
}

# 12__CreateCredentialProxy. Create Credential & Proxy on SQL Server. If Instance being baselined is same as data collector job owner
$stepName = '12__CreateCredentialProxy'
if( $requireProxy -and ($stepName -in $Steps2Execute) ) 
{
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."

    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Create new SQL Credential [$credentialName] on [$SqlInstanceForPowershellJobs].."
    $dbaCredential = @()
    $dbaCredential += Get-DbaCredential -SqlInstance $conSqlInstanceForPowershellJobs -Name $credentialName -EnableException
    if($dbaCredential.Count -eq 0) {
        New-DbaCredential -SqlInstance $conSqlInstanceForPowershellJobs -Identity $credentialName -SecurePassword $credentialPassword -EnableException
    } else {
        "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "SQL Credential [$credentialName] already exists on [$SqlInstanceForPowershellJobs].."
    }
    $dbaAgentProxy = @()
    $dbaAgentProxy += Get-DbaAgentProxy -SqlInstance $conSqlInstanceForPowershellJobs -Proxy $credentialName -EnableException
    if($dbaAgentProxy.Count -eq 0) {
        New-DbaAgentProxy -SqlInstance $conSqlInstanceForPowershellJobs -Name $credentialName -ProxyCredential $credentialName -SubSystem CmdExec, PowerShell -EnableException
    } else {
        "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "SQL Agent Proxy [$credentialName] already exists on [$SqlInstanceForPowershellJobs].."
    }
}


# 13__CreateJobCollectDiskSpace
$stepName = '13__CreateJobCollectDiskSpace'
if($stepName -in $Steps2Execute) 
{
    $jobName = '(dba) Collect-DiskSpace'
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$CollectDiskSpaceJobFilePath = '$CollectDiskSpaceJobFilePath'"

    # Append HostName if Job Server is different    
    $jobNameNew = $jobName
    $sqlInstanceOnJobStep = "$SqlInstanceAsDataDestinationWithOutPort"
    if( ($SqlInstanceToBaseline -ne $SqlInstanceForPowershellJobs) -or ($HostName -ne $jobServerDbServiceInfo.host_name) ) {
        $jobNameNew = "$jobName - $HostName"
        $sqlInstanceOnJobStep = $SqlInstanceAsDataDestination
    }    

    # Replace defaults
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating job [$jobNameNew] on [$SqlInstanceForPowershellJobs].."
    $sqlCreateJobCollectDiskSpace = [System.IO.File]::ReadAllText($CollectDiskSpaceJobFilePath).Replace('-SqlInstance localhost', "-SqlInstance `"$sqlInstanceOnJobStep`"")
    $sqlCreateJobCollectDiskSpace = $sqlCreateJobCollectDiskSpace.Replace('-Database DBA', "-Database `"$DbaDatabase`"")
    $sqlCreateJobCollectDiskSpace = $sqlCreateJobCollectDiskSpace.Replace('-HostName localhost', "-HostName `"$HostName`"")
    if($jobNameNew -ne $jobName) {
        $sqlCreateJobCollectDiskSpace = $sqlCreateJobCollectDiskSpace.Replace($jobName, $jobNameNew)
    }

    if($RemoteSQLMonitorPath -ne 'C:\SQLMonitor') {
        $sqlCreateJobCollectDiskSpace = $sqlCreateJobCollectDiskSpace.Replace('C:\SQLMonitor', $RemoteSQLMonitorPath)
    }

    # If Express edition, and Task scheduler jobs are required
    if( ((-not [String]::IsNullOrEmpty($WindowsCredential)) -or ($ssnHostName -eq $env:COMPUTERNAME)) `
        -and ($isExpressEdition -or $ForceSetupOfTaskSchedulerJobs) -and ($ConfirmSetupOfTaskSchedulerJobs -or $ForceSetupOfTaskSchedulerJobs) )
    {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Extract Job command from '$CollectDiskSpaceJobFilePath'.."
        [String]$jobArguments = $null
        if($sqlCreateJobCollectDiskSpace -match "@command=N'powershell.exe(?'arguments'.*)',") {
            $jobArguments = $Matches['arguments']
        }

        if([String]::IsNullOrEmpty($jobArguments)) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Failure in extracting Job command in '$stepName'." | Write-Host -ForegroundColor Red
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly Resolve above error." | Write-Error
        }

        $jobDescription = "Run Job [$jobName] daily every 30 minutes"
        $timeIntervalMinutes = "00:30"
        $taskPath = '\DBA\'
        $parameters = @{
            Session = $ssn4PerfmonSetup
            ScriptBlock = {
                Param ($jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $DropCreatePowerShellJobs)

                $currentTime = Get-Date
                $durationString = ($currentTime.AddMinutes(1)).ToString('HH:mm')

                $doStuff = New-ScheduledTaskAction -Execute 'powershell' -Argument "$jobArguments *> '$logsPath\$jobName.txt'"
                $timeToDoStuff = New-ScheduledTaskTrigger -Daily -DaysInterval 1 -RandomDelay "00:30" -At $durationString
                $timeToDoStuff.Repetition = $(New-ScheduledTaskTrigger -Once -RandomDelay "00:30" -At $durationString -RepetitionDuration "23:59" -RepetitionInterval $timeIntervalMinutes).Repetition
                $settingsForTheStuff = New-ScheduledTaskSettingsSet
                $runAsUser = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest
                $finalBuildOfTheStuff = New-ScheduledTask -Action $doStuff -Trigger $timeToDoStuff -Settings $settingsForTheStuff -Principal $runAsUser -Description $jobDescription

                $taskObj = @()
                try { $taskObj += Get-ScheduledTask -TaskName $jobName -TaskPath $taskPath -ErrorAction SilentlyContinue }
                catch { "Some Error" | Out-Null }

                $isCreated = $false
                if([String]::IsNullOrEmpty($taskObj)) {
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] created in Windows Task Scheduler."
                }
                elseif ($DropCreatePowerShellJobs) {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Drop/Recreate Job [$jobName] in Windows Task Scheduler.."
                    $taskObj | Unregister-ScheduledTask -Confirm:$false | Out-Null
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] dropped & recreated in Windows Task Scheduler."
                }
                else {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] already exists in Windows Task Scheduler."
                }

                if($isCreated) {
                    Start-ScheduledTask -TaskName $jobName -TaskPath $taskPath | Out-Null
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "Kindly ensure windows Task Scheduler job [$($taskPath)$($jobName)] is running without Error." #| Write-Host -ForegroundColor Yellow
                }
            }
            ArgumentList = $jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $DropCreatePowerShellJobs
        }

        Invoke-Command @parameters -ErrorAction Stop
    }
    else # If not express edition
    {
        if($DropCreatePowerShellJobs) {
            $tsqlSSMSValidation = "and APP_NAME() = 'Microsoft SQL Server Management Studio - Query'"
            $sqlCreateJobCollectDiskSpace = $sqlCreateJobCollectDiskSpace.Replace($tsqlSSMSValidation, "--$tsqlSSMSValidation")
        }
        Invoke-DbaQuery -SqlInstance $conSqlInstanceForPowershellJobs -Database msdb -Query $sqlCreateJobCollectDiskSpace -EnableException

        if($requireProxy) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Update job [$jobNameNew] to run under proxy [$credentialName].."
            $sqlUpdateJob = "EXEC msdb.dbo.sp_update_jobstep @job_name=N'$jobNameNew', @step_id=1 ,@proxy_name=N'$credentialName';"
            Invoke-DbaQuery -SqlInstance $conSqlInstanceForPowershellJobs -Database msdb -Query $sqlUpdateJob -EnableException
        }
        $sqlStartJob = "EXEC msdb.dbo.sp_start_job @job_name=N'$jobNameNew';"
        Invoke-DbaQuery -SqlInstance $conSqlInstanceForPowershellJobs -Database msdb -Query $sqlStartJob -EnableException
    }
}


# 14__CreateJobCollectOSProcesses
$stepName = '14__CreateJobCollectOSProcesses'
if($stepName -in $Steps2Execute) 
{
    $jobName = '(dba) Collect-OSProcesses'
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$CollectOSProcessesJobFilePath = '$CollectOSProcessesJobFilePath'"

    # Append HostName if Job Server is different    
    $jobNameNew = $jobName
    $sqlInstanceOnJobStep = "$SqlInstanceAsDataDestinationWithOutPort"
    if( ($SqlInstanceToBaseline -ne $SqlInstanceForPowershellJobs) -or ($HostName -ne $jobServerDbServiceInfo.host_name) ) {
        $jobNameNew = "$jobName - $HostName"
        $sqlInstanceOnJobStep = $SqlInstanceAsDataDestination
    }   

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating job [$jobNameNew] on [$SqlInstanceForPowershellJobs].."
    $sqlCreateJobCollectOSProcesses = [System.IO.File]::ReadAllText($CollectOSProcessesJobFilePath).Replace('-SqlInstance localhost', "-SqlInstance `"$sqlInstanceOnJobStep`"")
    $sqlCreateJobCollectOSProcesses = $sqlCreateJobCollectOSProcesses.Replace('-Database DBA', "-Database `"$DbaDatabase`"")
    $sqlCreateJobCollectOSProcesses = $sqlCreateJobCollectOSProcesses.Replace('-HostName localhost', "-HostName `"$HostName`"")
    if($jobNameNew -ne $jobName) {
        $sqlCreateJobCollectOSProcesses = $sqlCreateJobCollectOSProcesses.Replace($jobName, $jobNameNew)
    }

    if($RemoteSQLMonitorPath -ne 'C:\SQLMonitor') {
        $sqlCreateJobCollectOSProcesses = $sqlCreateJobCollectOSProcesses.Replace('C:\SQLMonitor', $RemoteSQLMonitorPath)
    }

    # If Express edition, and Task scheduler jobs are required
    if( ((-not [String]::IsNullOrEmpty($WindowsCredential)) -or ($ssnHostName -eq $env:COMPUTERNAME)) `
        -and ($isExpressEdition -or $ForceSetupOfTaskSchedulerJobs) -and ($ConfirmSetupOfTaskSchedulerJobs -or $ForceSetupOfTaskSchedulerJobs) )
    {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Extract Job command from '$CollectOSProcessesJobFilePath'.."
        [String]$jobArguments = $null
        if($sqlCreateJobCollectOSProcesses -match "@command=N'powershell.exe(?'arguments'.*)',") {
            $jobArguments = $Matches['arguments']
        }

        if([String]::IsNullOrEmpty($jobArguments)) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Failure in extracting Job command in '$stepName'." | Write-Host -ForegroundColor Red
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly Resolve above error." | Write-Error
        }

        $jobDescription = "Run Job [$jobName] daily every 2 minutes"
        $timeIntervalMinutes = "00:02"
        $taskPath = '\DBA\'
        $parameters = @{
            Session = $ssn4PerfmonSetup
            ScriptBlock = {
                Param ($jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $DropCreatePowerShellJobs)

                $currentTime = Get-Date
                $durationString = ($currentTime.AddMinutes(1)).ToString('HH:mm')

                $doStuff = New-ScheduledTaskAction -Execute 'powershell' -Argument "$jobArguments *> '$logsPath\$jobName.txt'"
                $timeToDoStuff = New-ScheduledTaskTrigger -Daily -DaysInterval 1 -RandomDelay "00:30" -At $durationString
                $timeToDoStuff.Repetition = $(New-ScheduledTaskTrigger -Once -RandomDelay "00:30" -At $durationString -RepetitionDuration "23:59" -RepetitionInterval $timeIntervalMinutes).Repetition
                $settingsForTheStuff = New-ScheduledTaskSettingsSet
                $runAsUser = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest
                $finalBuildOfTheStuff = New-ScheduledTask -Action $doStuff -Trigger $timeToDoStuff -Settings $settingsForTheStuff -Principal $runAsUser -Description $jobDescription

                $taskObj = @()
                try { $taskObj += Get-ScheduledTask -TaskName $jobName -TaskPath $taskPath -ErrorAction SilentlyContinue }
                catch { "Some Error" | Out-Null }

                $isCreated = $false
                if([String]::IsNullOrEmpty($taskObj)) {
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] created in Windows Task Scheduler."
                }
                elseif ($DropCreatePowerShellJobs) {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Drop/Recreate Job [$jobName] in Windows Task Scheduler.."
                    $taskObj | Unregister-ScheduledTask -Confirm:$false | Out-Null
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] dropped & recreated in Windows Task Scheduler."
                }
                else {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] already exists in Windows Task Scheduler."
                }

                if($isCreated) {
                    Start-ScheduledTask -TaskName $jobName -TaskPath $taskPath | Out-Null
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "Kindly ensure windows Task Scheduler job [$($taskPath)$($jobName)] is running without Error." #| Write-Host -ForegroundColor Yellow
                }
            }
            ArgumentList = $jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $DropCreatePowerShellJobs
        }

        Invoke-Command @parameters -ErrorAction Stop
    }
    else # If not express edition
    {
        if($DropCreatePowerShellJobs) {
            $tsqlSSMSValidation = "and APP_NAME() = 'Microsoft SQL Server Management Studio - Query'"
            $sqlCreateJobCollectOSProcesses = $sqlCreateJobCollectOSProcesses.Replace($tsqlSSMSValidation, "--$tsqlSSMSValidation")
        }
        Invoke-DbaQuery -SqlInstance $conSqlInstanceForPowershellJobs -Database msdb -Query $sqlCreateJobCollectOSProcesses -EnableException

        if($requireProxy) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Update job [$jobNameNew] to run under proxy [$credentialName].."
            $sqlUpdateJob = "EXEC msdb.dbo.sp_update_jobstep @job_name=N'$jobNameNew', @step_id=1 ,@proxy_name=N'$credentialName';"
            Invoke-DbaQuery -SqlInstance $conSqlInstanceForPowershellJobs -Database msdb -Query $sqlUpdateJob -EnableException
        }
        $sqlStartJob = "EXEC msdb.dbo.sp_start_job @job_name=N'$jobNameNew';"
        Invoke-DbaQuery -SqlInstance $conSqlInstanceForPowershellJobs -Database msdb -Query $sqlStartJob -EnableException
    }
}


# 15__CreateJobCollectPerfmonData
$stepName = '15__CreateJobCollectPerfmonData'
if($stepName -in $Steps2Execute) 
{
    $jobName = '(dba) Collect-PerfmonData'
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$CollectPerfmonDataJobFilePath = '$CollectPerfmonDataJobFilePath'"

    # Append HostName if Job Server is different    
    $jobNameNew = $jobName
    $sqlInstanceOnJobStep = "$SqlInstanceAsDataDestinationWithOutPort"
    if( ($SqlInstanceToBaseline -ne $SqlInstanceForPowershellJobs) -or ($HostName -ne $jobServerDbServiceInfo.host_name) ) {
        $jobNameNew = "$jobName - $HostName"
        $sqlInstanceOnJobStep = $SqlInstanceAsDataDestination
    }

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating job [$jobNameNew] on [$SqlInstanceForPowershellJobs].."
    $sqlCreateJobCollectPerfmonData = [System.IO.File]::ReadAllText($CollectPerfmonDataJobFilePath).Replace('-SqlInstance localhost', "-SqlInstance `"$sqlInstanceOnJobStep`"")
    $sqlCreateJobCollectPerfmonData = $sqlCreateJobCollectPerfmonData.Replace('-Database DBA', "-Database `"$DbaDatabase`"")
    $sqlCreateJobCollectPerfmonData = $sqlCreateJobCollectPerfmonData.Replace('-HostName localhost', "-HostName `"$HostName`"")
    if($jobNameNew -ne $jobName) {
        $sqlCreateJobCollectPerfmonData = $sqlCreateJobCollectPerfmonData.Replace($jobName, $jobNameNew)
    }
    
    if($RemoteSQLMonitorPath -ne 'C:\SQLMonitor') {
        $sqlCreateJobCollectPerfmonData = $sqlCreateJobCollectPerfmonData.Replace('C:\SQLMonitor', $RemoteSQLMonitorPath)
    }
    
    # If Express edition, and Task scheduler jobs are required
    if( ((-not [String]::IsNullOrEmpty($WindowsCredential)) -or ($ssnHostName -eq $env:COMPUTERNAME)) `
        -and ($isExpressEdition -or $ForceSetupOfTaskSchedulerJobs) -and ($ConfirmSetupOfTaskSchedulerJobs -or $ForceSetupOfTaskSchedulerJobs) )
    {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Extract Job command from '$CollectPerfmonDataJobFilePath'.."
        [String]$jobArguments = $null
        if($sqlCreateJobCollectPerfmonData -match "@command=N'powershell.exe(?'arguments'.*)',") {
            $jobArguments = $Matches['arguments']
        }

        if([String]::IsNullOrEmpty($jobArguments)) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Failure in extracting Job command in '$stepName'." | Write-Host -ForegroundColor Red
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly Resolve above error." | Write-Error
        }

        $jobDescription = "Run Job [$jobName] daily every 1 minutes"
        $timeIntervalMinutes = "00:01"
        $taskPath = '\DBA\'
        $parameters = @{
            Session = $ssn4PerfmonSetup
            ScriptBlock = {
                Param ($jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $DropCreatePowerShellJobs)

                $currentTime = Get-Date
                $durationString = ($currentTime.AddMinutes(1)).ToString('HH:mm')

                $doStuff = New-ScheduledTaskAction -Execute 'powershell' -Argument "$jobArguments *> '$logsPath\$jobName.txt'"
                $timeToDoStuff = New-ScheduledTaskTrigger -Daily -DaysInterval 1 -RandomDelay "00:30" -At $durationString
                $timeToDoStuff.Repetition = $(New-ScheduledTaskTrigger -Once -RandomDelay "00:30" -At $durationString -RepetitionDuration "23:59" -RepetitionInterval $timeIntervalMinutes).Repetition
                $settingsForTheStuff = New-ScheduledTaskSettingsSet
                $runAsUser = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest
                $finalBuildOfTheStuff = New-ScheduledTask -Action $doStuff -Trigger $timeToDoStuff -Settings $settingsForTheStuff -Principal $runAsUser -Description $jobDescription

                $taskObj = @()
                try { $taskObj += Get-ScheduledTask -TaskName $jobName -TaskPath $taskPath -ErrorAction SilentlyContinue }
                catch { "Some Error" | Out-Null }

                $isCreated = $false
                if([String]::IsNullOrEmpty($taskObj)) {
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] created in Windows Task Scheduler."
                }
                elseif ($DropCreatePowerShellJobs) {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Drop/Recreate Job [$jobName] in Windows Task Scheduler.."
                    $taskObj | Unregister-ScheduledTask -Confirm:$false | Out-Null
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] dropped & recreated in Windows Task Scheduler."
                }
                else {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] already exists in Windows Task Scheduler."
                }

                if($isCreated) {
                    Start-ScheduledTask -TaskName $jobName -TaskPath $taskPath | Out-Null
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "Kindly ensure windows Task Scheduler job [$($taskPath)$($jobName)] is running without Error." #| Write-Host -ForegroundColor Yellow
                }
            }
            ArgumentList = $jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $DropCreatePowerShellJobs
        }

        Invoke-Command @parameters -ErrorAction Stop
    }
    else # If not express edition
    {
        if($DropCreatePowerShellJobs) {
            $tsqlSSMSValidation = "and APP_NAME() = 'Microsoft SQL Server Management Studio - Query'"
            $sqlCreateJobCollectPerfmonData = $sqlCreateJobCollectPerfmonData.Replace($tsqlSSMSValidation, "--$tsqlSSMSValidation")
        }
        Invoke-DbaQuery -SqlInstance $conSqlInstanceForPowershellJobs -Database msdb -Query $sqlCreateJobCollectPerfmonData -EnableException

        if($requireProxy) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Update job [$jobNameNew] to run under proxy [$credentialName].."
            $sqlUpdateJob = "EXEC msdb.dbo.sp_update_jobstep @job_name=N'$jobNameNew', @step_id=1 ,@proxy_name=N'$credentialName';"
            Invoke-DbaQuery -SqlInstance $conSqlInstanceForPowershellJobs -Database msdb -Query $sqlUpdateJob -EnableException
        }
        $sqlStartJob = "EXEC msdb.dbo.sp_start_job @job_name=N'$jobNameNew';"
        Invoke-DbaQuery -SqlInstance $conSqlInstanceForPowershellJobs -Database msdb -Query $sqlStartJob -EnableException
    }
}


# 16__CreateJobCollectWaitStats
$stepName = '16__CreateJobCollectWaitStats'
if($stepName -in $Steps2Execute) 
{
    $jobName = '(dba) Collect-WaitStats'
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$CollectWaitStatsJobFilePath = '$CollectWaitStatsJobFilePath'"

    # Append HostName if Job Server is different    
    $jobNameNew = $jobName
    $sqlInstanceOnJobStep = "$SqlInstanceToBaselineWithOutPort"
    if($SqlInstanceToBaseline -ne $SqlInstanceForTsqlJobs) {
        $jobNameNew = "$jobName - $SqlInstanceToBaseline"
        $sqlInstanceOnJobStep = $SqlInstanceToBaseline
    }

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating job [$jobNameNew] on [$SqlInstanceForTsqlJobs].."
    $sqlCreateJobCollectWaitStats = [System.IO.File]::ReadAllText($CollectWaitStatsJobFilePath)
    $sqlCreateJobCollectWaitStats = $sqlCreateJobCollectWaitStats.Replace('-S localhost', "-S `"$sqlInstanceOnJobStep`"")
    $sqlCreateJobCollectWaitStats = $sqlCreateJobCollectWaitStats.Replace('-d DBA', "-d `"$DbaDatabase`"")
    $sqlCreateJobCollectWaitStats = $sqlCreateJobCollectWaitStats.Replace("''some_dba_mail_id@gmail.com''", "''$($DbaGroupMailId -join ';')'';" )
    if($jobNameNew -ne $jobName) {
        $sqlCreateJobCollectWaitStats = $sqlCreateJobCollectWaitStats.Replace($jobName, $jobNameNew)
    }

    # If Express edition, and Task scheduler jobs are required
    if( ((-not [String]::IsNullOrEmpty($WindowsCredential)) -or ($ssnHostName -eq $env:COMPUTERNAME)) `
        -and ($isExpressEdition -or $ForceSetupOfTaskSchedulerJobs) -and ($ConfirmSetupOfTaskSchedulerJobs -or $ForceSetupOfTaskSchedulerJobs) )
    {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Extract Job command from '$CollectWaitStatsJobFilePath'.."
        [String]$jobArguments = $null
        if($sqlCreateJobCollectWaitStats -match "@command=N'sqlcmd (?'arguments'.*)',") {
            $jobArguments = $Matches['arguments']
            $jobArguments = $jobArguments.Replace("''","'").Replace(";;",";")
        }

        if([String]::IsNullOrEmpty($jobArguments)) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Failure in extracting Job command in '$stepName'." | Write-Host -ForegroundColor Red
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly Resolve above error." | Write-Error
        }

        $jobDescription = "Run Job [$jobName] daily every 1 minutes"
        $timeIntervalMinutes = "00:01"
        $taskPath = '\DBA\'
        $parameters = @{
            Session = $ssn4PerfmonSetup
            ScriptBlock = {
                Param ($jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $SkipTsqlJobs)

                $currentTime = Get-Date
                $durationString = ($currentTime.AddMinutes(1)).ToString('HH:mm')

                $doStuff = New-ScheduledTaskAction -Execute 'sqlcmd' -Argument "$jobArguments -o `"$logsPath\$jobName.txt`""
                $timeToDoStuff = New-ScheduledTaskTrigger -Daily -DaysInterval 1 -RandomDelay "00:30" -At $durationString
                $timeToDoStuff.Repetition = $(New-ScheduledTaskTrigger -Once -RandomDelay "00:30" -At $durationString -RepetitionDuration "23:59" -RepetitionInterval $timeIntervalMinutes).Repetition
                $settingsForTheStuff = New-ScheduledTaskSettingsSet
                $runAsUser = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest
                $finalBuildOfTheStuff = New-ScheduledTask -Action $doStuff -Trigger $timeToDoStuff -Settings $settingsForTheStuff -Principal $runAsUser -Description $jobDescription

                $taskObj = @()
                try { $taskObj += Get-ScheduledTask -TaskName $jobName -TaskPath $taskPath -ErrorAction SilentlyContinue }
                catch { "Some Error" | Out-Null }

                $isCreated = $false
                if([String]::IsNullOrEmpty($taskObj)) {
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] created in Windows Task Scheduler."
                }
                elseif ($SkipTsqlJobs -eq $false) {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Drop/Recreate Job [$jobName] in Windows Task Scheduler.."
                    $taskObj | Unregister-ScheduledTask -Confirm:$false | Out-Null
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] dropped & recreated in Windows Task Scheduler."
                }
                else {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] already exists in Windows Task Scheduler."
                }

                if($isCreated) {
                    Start-ScheduledTask -TaskName $jobName -TaskPath $taskPath | Out-Null
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "Kindly ensure windows Task Scheduler job [$($taskPath)$($jobName)] is running without Error." #| Write-Host -ForegroundColor Yellow
                }
            }
            ArgumentList = $jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $SkipTsqlJobs
        }

        Invoke-Command @parameters -ErrorAction Stop
    }
    else # If not express edition
    {
        Invoke-DbaQuery -SqlInstance $conSqlInstanceForTsqlJobs -Database msdb -Query $sqlCreateJobCollectWaitStats -EnableException
    }
}


# 17__CreateJobCollectXEvents
$stepName = '17__CreateJobCollectXEvents'
if($stepName -in $Steps2Execute) 
{
    $jobName = '(dba) Collect-XEvents'
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$CollectXEventsJobFilePath = '$CollectXEventsJobFilePath'"

    # Append HostName if Job Server is different    
    $jobNameNew = $jobName
    $sqlInstanceOnJobStep = "$SqlInstanceToBaselineWithOutPort"
    if($SqlInstanceToBaseline -ne $SqlInstanceForTsqlJobs) {
        $jobNameNew = "$jobName - $SqlInstanceToBaseline"
        $sqlInstanceOnJobStep = $SqlInstanceToBaseline
    }

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating job [$jobNameNew] on [$SqlInstanceForTsqlJobs].."
    $sqlCreateJobCollectXEvents = [System.IO.File]::ReadAllText($CollectXEventsJobFilePath)
    $sqlCreateJobCollectXEvents = $sqlCreateJobCollectXEvents.Replace('-S localhost', "-S `"$sqlInstanceOnJobStep`"")
    $sqlCreateJobCollectXEvents = $sqlCreateJobCollectXEvents.Replace('-d DBA', "-d `"$DbaDatabase`"")
    if($jobNameNew -ne $jobName) {
        $sqlCreateJobCollectXEvents = $sqlCreateJobCollectXEvents.Replace($jobName, $jobNameNew)
    }

    # If Express edition, and Task scheduler jobs are required
    if( ((-not [String]::IsNullOrEmpty($WindowsCredential)) -or ($ssnHostName -eq $env:COMPUTERNAME)) `
        -and ($isExpressEdition -or $ForceSetupOfTaskSchedulerJobs) -and ($ConfirmSetupOfTaskSchedulerJobs -or $ForceSetupOfTaskSchedulerJobs) )
    {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Extract Job command from '$CollectXEventsJobFilePath'.."
        [String]$jobArguments = $null
        if($sqlCreateJobCollectXEvents -match "@command=N'sqlcmd (?'arguments'.*)',") {
            $jobArguments = $Matches['arguments']
            $jobArguments = $jobArguments.Replace("''","'").Replace(";;",";")
        }

        if([String]::IsNullOrEmpty($jobArguments)) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Failure in extracting Job command in '$stepName'." | Write-Host -ForegroundColor Red
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly Resolve above error." | Write-Error
        }

        $jobDescription = "Run Job [$jobName] daily every 1 minutes"
        $timeIntervalMinutes = "00:01"
        $taskPath = '\DBA\'
        $parameters = @{
            Session = $ssn4PerfmonSetup
            ScriptBlock = {
                Param ($jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $SkipTsqlJobs)

                $currentTime = Get-Date
                $durationString = ($currentTime.AddMinutes(1)).ToString('HH:mm')

                $doStuff = New-ScheduledTaskAction -Execute 'sqlcmd' -Argument "$jobArguments -o `"$logsPath\$jobName.txt`""
                $timeToDoStuff = New-ScheduledTaskTrigger -Daily -DaysInterval 1 -RandomDelay "00:30" -At $durationString
                $timeToDoStuff.Repetition = $(New-ScheduledTaskTrigger -Once -RandomDelay "00:30" -At $durationString -RepetitionDuration "23:59" -RepetitionInterval $timeIntervalMinutes).Repetition
                $settingsForTheStuff = New-ScheduledTaskSettingsSet
                $runAsUser = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest
                $finalBuildOfTheStuff = New-ScheduledTask -Action $doStuff -Trigger $timeToDoStuff -Settings $settingsForTheStuff -Principal $runAsUser -Description $jobDescription

                $taskObj = @()
                try { $taskObj += Get-ScheduledTask -TaskName $jobName -TaskPath $taskPath -ErrorAction SilentlyContinue }
                catch { "Some Error" | Out-Null }

                $isCreated = $false
                if([String]::IsNullOrEmpty($taskObj)) {
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] created in Windows Task Scheduler."
                }
                elseif ($SkipTsqlJobs -eq $false) {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Drop/Recreate Job [$jobName] in Windows Task Scheduler.."
                    $taskObj | Unregister-ScheduledTask -Confirm:$false | Out-Null
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] dropped & recreated in Windows Task Scheduler."
                }
                else {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] already exists in Windows Task Scheduler."
                }

                if($isCreated) {
                    Start-ScheduledTask -TaskName $jobName -TaskPath $taskPath | Out-Null
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "Kindly ensure windows Task Scheduler job [$($taskPath)$($jobName)] is running without Error." #| Write-Host -ForegroundColor Yellow
                }
            }
            ArgumentList = $jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $SkipTsqlJobs
        }

        Invoke-Command @parameters -ErrorAction Stop
    }
    else # If not express edition
    {
        Invoke-DbaQuery -SqlInstance $conSqlInstanceForTsqlJobs -Database msdb -Query $sqlCreateJobCollectXEvents -EnableException
    }
}


# 18__CreateJobCollectFileIOStats
$stepName = '18__CreateJobCollectFileIOStats'
if($stepName -in $Steps2Execute) 
{
    $jobName = '(dba) Collect-FileIOStats'
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$CollectFileIOStatsJobFilePath = '$CollectFileIOStatsJobFilePath'"

    # Append HostName if Job Server is different    
    $jobNameNew = $jobName
    $sqlInstanceOnJobStep = "$SqlInstanceToBaselineWithOutPort"
    if($SqlInstanceToBaseline -ne $SqlInstanceForTsqlJobs) {
        $jobNameNew = "$jobName - $SqlInstanceToBaseline"
        $sqlInstanceOnJobStep = $SqlInstanceToBaseline
    }

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating job [$jobNameNew] on [$SqlInstanceForTsqlJobs].."
    $sqlCreateJobFileIOStats = [System.IO.File]::ReadAllText($CollectFileIOStatsJobFilePath)
    $sqlCreateJobFileIOStats = $sqlCreateJobFileIOStats.Replace('-S localhost', "-S `"$sqlInstanceOnJobStep`"")
    $sqlCreateJobFileIOStats = $sqlCreateJobFileIOStats.Replace('-d DBA', "-d `"$DbaDatabase`"")
    $sqlCreateJobFileIOStats = $sqlCreateJobFileIOStats.Replace("''some_dba_mail_id@gmail.com''", "''$($DbaGroupMailId -join ';')'';" )
    if($jobNameNew -ne $jobName) {
        $sqlCreateJobFileIOStats = $sqlCreateJobFileIOStats.Replace($jobName, $jobNameNew)
    }

    # If Express edition, and Task scheduler jobs are required
    if( ((-not [String]::IsNullOrEmpty($WindowsCredential)) -or ($ssnHostName -eq $env:COMPUTERNAME)) `
        -and ($isExpressEdition -or $ForceSetupOfTaskSchedulerJobs) -and ($ConfirmSetupOfTaskSchedulerJobs -or $ForceSetupOfTaskSchedulerJobs) )
    {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Extract Job command from '$CollectFileIOStatsJobFilePath'.."
        [String]$jobArguments = $null
        if($sqlCreateJobFileIOStats -match "@command=N'sqlcmd (?'arguments'.*)',") {
            $jobArguments = $Matches['arguments']
            $jobArguments = $jobArguments.Replace("''","'").Replace(";;",";")
        }

        if([String]::IsNullOrEmpty($jobArguments)) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Failure in extracting Job command in '$stepName'." | Write-Host -ForegroundColor Red
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly Resolve above error." | Write-Error
        }

        $jobDescription = "Run Job [$jobName] daily every 10 minutes"
        $timeIntervalMinutes = "00:10"
        $taskPath = '\DBA\'
        $parameters = @{
            Session = $ssn4PerfmonSetup
            ScriptBlock = {
                Param ($jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $SkipTsqlJobs)

                $currentTime = Get-Date
                $durationString = ($currentTime.AddMinutes(1)).ToString('HH:mm')

                $doStuff = New-ScheduledTaskAction -Execute 'sqlcmd' -Argument "$jobArguments -o `"$logsPath\$jobName.txt`""
                $timeToDoStuff = New-ScheduledTaskTrigger -Daily -DaysInterval 1 -RandomDelay "00:30" -At $durationString
                $timeToDoStuff.Repetition = $(New-ScheduledTaskTrigger -Once -RandomDelay "00:30" -At $durationString -RepetitionDuration "23:59" -RepetitionInterval $timeIntervalMinutes).Repetition
                $settingsForTheStuff = New-ScheduledTaskSettingsSet
                $runAsUser = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest
                $finalBuildOfTheStuff = New-ScheduledTask -Action $doStuff -Trigger $timeToDoStuff -Settings $settingsForTheStuff -Principal $runAsUser -Description $jobDescription

                $taskObj = @()
                try { $taskObj += Get-ScheduledTask -TaskName $jobName -TaskPath $taskPath -ErrorAction SilentlyContinue }
                catch { "Some Error" | Out-Null }

                $isCreated = $false
                if([String]::IsNullOrEmpty($taskObj)) {
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] created in Windows Task Scheduler."
                }
                elseif ($SkipTsqlJobs -eq $false) {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Drop/Recreate Job [$jobName] in Windows Task Scheduler.."
                    $taskObj | Unregister-ScheduledTask -Confirm:$false | Out-Null
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] dropped & recreated in Windows Task Scheduler."
                }
                else {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] already exists in Windows Task Scheduler."
                }

                if($isCreated) {
                    Start-ScheduledTask -TaskName $jobName -TaskPath $taskPath | Out-Null
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "Kindly ensure windows Task Scheduler job [$($taskPath)$($jobName)] is running without Error." #| Write-Host -ForegroundColor Yellow
                }
            }
            ArgumentList = $jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $SkipTsqlJobs
        }

        Invoke-Command @parameters -ErrorAction Stop        
    }
    else # If not express edition
    {
        Invoke-DbaQuery -SqlInstance $conSqlInstanceForTsqlJobs -Database msdb -Query $sqlCreateJobFileIOStats -EnableException
    }
}


# 19__CreateJobPartitionsMaintenance
$stepName = '19__CreateJobPartitionsMaintenance'
if($stepName -in $Steps2Execute -and $IsNonPartitioned -eq $false) 
{
    $jobName = '(dba) Partitions-Maintenance'
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$PartitionsMaintenanceJobFilePath = '$PartitionsMaintenanceJobFilePath'"

    # Append HostName if Job Server is different    
    $jobNameNew = $jobName
    $sqlInstanceOnJobStep = "$SqlInstanceToBaselineWithOutPort"
    if($SqlInstanceToBaseline -ne $SqlInstanceForTsqlJobs) {
        $jobNameNew = "$jobName - $SqlInstanceToBaseline"
        $sqlInstanceOnJobStep = $SqlInstanceToBaseline
    }

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating job [$jobNameNew] on [$SqlInstanceForTsqlJobs].."
    $sqlPartitionsMaintenance = [System.IO.File]::ReadAllText($PartitionsMaintenanceJobFilePath)
    $sqlPartitionsMaintenance = $sqlPartitionsMaintenance.Replace('-S localhost', "-S `"$sqlInstanceOnJobStep`"")
    $sqlPartitionsMaintenance = $sqlPartitionsMaintenance.Replace('-d DBA', "-d `"$DbaDatabase`"")
    if($jobNameNew -ne $jobName) {
        $sqlPartitionsMaintenance = $sqlPartitionsMaintenance.Replace($jobName, $jobNameNew)
    }
    
    # If Express edition, and Task scheduler jobs are required
    if( ((-not [String]::IsNullOrEmpty($WindowsCredential)) -or ($ssnHostName -eq $env:COMPUTERNAME)) `
        -and ($isExpressEdition -or $ForceSetupOfTaskSchedulerJobs) -and ($ConfirmSetupOfTaskSchedulerJobs -or $ForceSetupOfTaskSchedulerJobs) )
    {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Extract Job command from '$PartitionsMaintenanceJobFilePath'.."
        [String]$jobArguments = $null
        if($sqlPartitionsMaintenance -match "@command=N'sqlcmd (?'arguments'.*)',") {
            $jobArguments = $Matches['arguments']
            $jobArguments = $jobArguments.Replace("''","'").Replace(";;",";")
        }

        if([String]::IsNullOrEmpty($jobArguments)) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Failure in extracting Job command in '$stepName'." | Write-Host -ForegroundColor Red
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly Resolve above error." | Write-Error
        }

        $jobDescription = "Run Job [$jobName] daily at 12:00 am"
        $timeIntervalMinutes = "00:10"
        $taskPath = '\DBA\'
        $parameters = @{
            Session = $ssn4PerfmonSetup
            ScriptBlock = {
                Param ($jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $SkipTsqlJobs)

                $currentTime = Get-Date
                #$durationString = ($currentTime.AddMinutes(1)).ToString('HH:mm')
                $durationString = '00:00'

                $doStuff = New-ScheduledTaskAction -Execute 'sqlcmd' -Argument "$jobArguments -o `"$logsPath\$jobName.txt`""
                $timeToDoStuff = New-ScheduledTaskTrigger -Daily -DaysInterval 1 -RandomDelay "00:30" -At $durationString
                #$timeToDoStuff.Repetition = $(New-ScheduledTaskTrigger -Once -RandomDelay "00:30" -At $durationString -RepetitionDuration "23:59" -RepetitionInterval $timeIntervalMinutes).Repetition
                $settingsForTheStuff = New-ScheduledTaskSettingsSet
                $runAsUser = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest
                $finalBuildOfTheStuff = New-ScheduledTask -Action $doStuff -Trigger $timeToDoStuff -Settings $settingsForTheStuff -Principal $runAsUser -Description $jobDescription

                $taskObj = @()
                try { $taskObj += Get-ScheduledTask -TaskName $jobName -TaskPath $taskPath -ErrorAction SilentlyContinue }
                catch { "Some Error" | Out-Null }

                $isCreated = $false
                if([String]::IsNullOrEmpty($taskObj)) {
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] created in Windows Task Scheduler."
                }
                elseif ($SkipTsqlJobs -eq $false) {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Drop/Recreate Job [$jobName] in Windows Task Scheduler.."
                    $taskObj | Unregister-ScheduledTask -Confirm:$false | Out-Null
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] dropped & recreated in Windows Task Scheduler."
                }
                else {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] already exists in Windows Task Scheduler."
                }

                if($isCreated) {
                    Start-ScheduledTask -TaskName $jobName -TaskPath $taskPath | Out-Null
                }
            }
            ArgumentList = $jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $SkipTsqlJobs
        }

        Invoke-Command @parameters -ErrorAction Stop
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "Kindly ensure windows Task Scheduler job [$($taskPath)$($jobName)] is running without Error." #| Write-Host -ForegroundColor Yellow
    }
    else # If not express edition
    {
        Invoke-DbaQuery -SqlInstance $conSqlInstanceForTsqlJobs -Database msdb -Query $sqlPartitionsMaintenance -EnableException
    }
}


# 20__CreateJobPurgeTables
$stepName = '20__CreateJobPurgeTables'
if($stepName -in $Steps2Execute) 
{
    $jobName = '(dba) Purge-Tables'
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$PurgeTablesJobFilePath = '$PurgeTablesJobFilePath'"

    # Append HostName if Job Server is different    
    $jobNameNew = $jobName
    $sqlInstanceOnJobStep = "$SqlInstanceToBaselineWithOutPort"
    if($SqlInstanceToBaseline -ne $SqlInstanceForTsqlJobs) {
        $jobNameNew = "$jobName - $SqlInstanceToBaseline"
        $sqlInstanceOnJobStep = $SqlInstanceToBaseline
    }

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating job [$jobNameNew] on [$SqlInstanceForTsqlJobs].."
    $sqlPurgeDbaMetrics = [System.IO.File]::ReadAllText($PurgeTablesJobFilePath)
    $sqlPurgeDbaMetrics = $sqlPurgeDbaMetrics.Replace('-S localhost', "-S `"$sqlInstanceOnJobStep`"")
    $sqlPurgeDbaMetrics = $sqlPurgeDbaMetrics.Replace('-d DBA', "-d `"$DbaDatabase`"")
    if($jobNameNew -ne $jobName) {
        $sqlPurgeDbaMetrics = $sqlPurgeDbaMetrics.Replace($jobName, $jobNameNew)
    }

    # If Express edition, and Task scheduler jobs are required
    if( ((-not [String]::IsNullOrEmpty($WindowsCredential)) -or ($ssnHostName -eq $env:COMPUTERNAME)) `
        -and ($isExpressEdition -or $ForceSetupOfTaskSchedulerJobs) -and ($ConfirmSetupOfTaskSchedulerJobs -or $ForceSetupOfTaskSchedulerJobs) )
    {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Extract Job command from '$PurgeTablesJobFilePath'.."
        [String]$jobArguments = $null
        if($sqlPurgeDbaMetrics -match "@command=N'sqlcmd (?'arguments'.*)',") {
            $jobArguments = $Matches['arguments']
            $jobArguments = $jobArguments.Replace("''","'").Replace(";;",";")
        }

        if([String]::IsNullOrEmpty($jobArguments)) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Failure in extracting Job command in '$stepName'." | Write-Host -ForegroundColor Red
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly Resolve above error." | Write-Error
        }

        $jobDescription = "Run Job [$jobName] daily at 12:00 am"
        $timeIntervalMinutes = "00:10"
        $taskPath = '\DBA\'
        $parameters = @{
            Session = $ssn4PerfmonSetup
            ScriptBlock = {
                Param ($jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $SkipTsqlJobs)

                $currentTime = Get-Date
                #$durationString = ($currentTime.AddMinutes(1)).ToString('HH:mm')
                $durationString = '00:00'

                $doStuff = New-ScheduledTaskAction -Execute 'sqlcmd' -Argument "$jobArguments -o `"$logsPath\$jobName.txt`""
                $timeToDoStuff = New-ScheduledTaskTrigger -Daily -DaysInterval 1 -RandomDelay "00:30" -At $durationString
                #$timeToDoStuff.Repetition = $(New-ScheduledTaskTrigger -Once -RandomDelay "00:30" -At $durationString -RepetitionDuration "23:59" -RepetitionInterval $timeIntervalMinutes).Repetition
                $settingsForTheStuff = New-ScheduledTaskSettingsSet
                $runAsUser = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest
                $finalBuildOfTheStuff = New-ScheduledTask -Action $doStuff -Trigger $timeToDoStuff -Settings $settingsForTheStuff -Principal $runAsUser -Description $jobDescription

                $taskObj = @()
                try { $taskObj += Get-ScheduledTask -TaskName $jobName -TaskPath $taskPath -ErrorAction SilentlyContinue }
                catch { "Some Error" | Out-Null }

                $isCreated = $false
                if([String]::IsNullOrEmpty($taskObj)) {
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] created in Windows Task Scheduler."
                }
                elseif ($SkipTsqlJobs -eq $false) {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Drop/Recreate Job [$jobName] in Windows Task Scheduler.."
                    $taskObj | Unregister-ScheduledTask -Confirm:$false | Out-Null
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] dropped & recreated in Windows Task Scheduler."
                }
                else {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] already exists in Windows Task Scheduler."
                }

                if($isCreated) {
                    Start-ScheduledTask -TaskName $jobName -TaskPath $taskPath | Out-Null
                }
            }
            ArgumentList = $jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $SkipTsqlJobs
        }

        Invoke-Command @parameters -ErrorAction Stop
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "Kindly ensure windows Task Scheduler job [$($taskPath)$($jobName)] is running without Error." #| Write-Host -ForegroundColor Yellow
    }
    else # If not express edition
    {
        Invoke-DbaQuery -SqlInstance $conSqlInstanceForTsqlJobs -Database msdb -Query $sqlPurgeDbaMetrics -EnableException
    }
}


# 21__CreateJobRemoveXEventFiles
$stepName = '21__CreateJobRemoveXEventFiles'
if($stepName -in $Steps2Execute) 
{
    $jobName = '(dba) Remove-XEventFiles'
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$RemoveXEventFilesJobFilePath = '$RemoveXEventFilesJobFilePath'"

    # Append HostName if Job Server is different    
    $jobNameNew = $jobName
    $sqlInstanceOnJobStep = "$SqlInstanceToBaselineWithOutPort"
    if( ($SqlInstanceToBaseline -ne $SqlInstanceForPowershellJobs) ) {
        $jobNameNew = "$jobName - $SqlInstanceToBaseline"
        $sqlInstanceOnJobStep = $SqlInstanceToBaseline
    }

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating job [$jobNameNew] on [$SqlInstanceForPowershellJobs].."
    $sqlCreateJobRemoveXEventFiles = [System.IO.File]::ReadAllText($RemoveXEventFilesJobFilePath)
    $sqlCreateJobRemoveXEventFiles = $sqlCreateJobRemoveXEventFiles.Replace('-SqlInstance localhost', "-SqlInstance `"$sqlInstanceOnJobStep`"")
    $sqlCreateJobRemoveXEventFiles = $sqlCreateJobRemoveXEventFiles.Replace('-Database DBA', "-Database `"$DbaDatabase`"")
    if($jobNameNew -ne $jobName) {
        $sqlCreateJobRemoveXEventFiles = $sqlCreateJobRemoveXEventFiles.Replace($jobName, $jobNameNew)
    }

    if($RemoteSQLMonitorPath -ne 'C:\SQLMonitor') {
        $sqlCreateJobRemoveXEventFiles = $sqlCreateJobRemoveXEventFiles.Replace('C:\SQLMonitor', $RemoteSQLMonitorPath)
    }

    # If Express edition, and Task scheduler jobs are required
    if( ((-not [String]::IsNullOrEmpty($WindowsCredential)) -or ($ssnHostName -eq $env:COMPUTERNAME)) `
        -and ($isExpressEdition -or $ForceSetupOfTaskSchedulerJobs) -and ($ConfirmSetupOfTaskSchedulerJobs -or $ForceSetupOfTaskSchedulerJobs) )
    {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Extract Job command from '$RemoveXEventFilesJobFilePath'.."
        [String]$jobArguments = $null
        if($sqlCreateJobRemoveXEventFiles -match "@command=N'powershell.exe(?'arguments'.*)',") {
            $jobArguments = $Matches['arguments']
        }

        if([String]::IsNullOrEmpty($jobArguments)) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Failure in extracting Job command in '$stepName'." | Write-Host -ForegroundColor Red
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly Resolve above error." | Write-Error
        }

        $jobDescription = "Run Job [$jobName] daily every 30 minutes"
        $timeIntervalMinutes = "00:30"
        $taskPath = '\DBA\'
        $parameters = @{
            Session = $ssn4PerfmonSetup
            ScriptBlock = {
                Param ($jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $DropCreatePowerShellJobs)

                $currentTime = Get-Date
                $durationString = ($currentTime.AddMinutes(1)).ToString('HH:mm')

                $doStuff = New-ScheduledTaskAction -Execute 'powershell' -Argument "$jobArguments *> '$logsPath\$jobName.txt'"
                $timeToDoStuff = New-ScheduledTaskTrigger -Daily -DaysInterval 1 -RandomDelay "00:30" -At $durationString
                $timeToDoStuff.Repetition = $(New-ScheduledTaskTrigger -Once -RandomDelay "00:30" -At $durationString -RepetitionDuration "23:59" -RepetitionInterval $timeIntervalMinutes).Repetition
                $settingsForTheStuff = New-ScheduledTaskSettingsSet
                $runAsUser = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest
                $finalBuildOfTheStuff = New-ScheduledTask -Action $doStuff -Trigger $timeToDoStuff -Settings $settingsForTheStuff -Principal $runAsUser -Description $jobDescription

                $taskObj = @()
                try { $taskObj += Get-ScheduledTask -TaskName $jobName -TaskPath $taskPath -ErrorAction SilentlyContinue }
                catch { "Some Error" | Out-Null }

                $isCreated = $false
                if([String]::IsNullOrEmpty($taskObj)) {
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] created in Windows Task Scheduler."
                }
                elseif ($DropCreatePowerShellJobs) {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Drop/Recreate Job [$jobName] in Windows Task Scheduler.."
                    $taskObj | Unregister-ScheduledTask -Confirm:$false | Out-Null
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] dropped & recreated in Windows Task Scheduler."
                }
                else {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] already exists in Windows Task Scheduler."
                }

                if($isCreated) {
                    Start-ScheduledTask -TaskName $jobName -TaskPath $taskPath | Out-Null
                }
            }
            ArgumentList = $jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $DropCreatePowerShellJobs
        }

        Invoke-Command @parameters -ErrorAction Stop
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "Kindly ensure windows Task Scheduler job [$($taskPath)$($jobName)] is running without Error." #| Write-Host -ForegroundColor Yellow
    }
    else # If not express edition
    {
        if($DropCreatePowerShellJobs) {
            $tsqlSSMSValidation = "and APP_NAME() = 'Microsoft SQL Server Management Studio - Query'"
            $sqlCreateJobRemoveXEventFiles = $sqlCreateJobRemoveXEventFiles.Replace($tsqlSSMSValidation, "--$tsqlSSMSValidation")
        }
        Invoke-DbaQuery -SqlInstance $conSqlInstanceForPowershellJobs -Database msdb -Query $sqlCreateJobRemoveXEventFiles -EnableException

        if($requireProxy) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Update job [$jobNameNew] to run under proxy [$credentialName].."
            $sqlUpdateJob = "EXEC msdb.dbo.sp_update_jobstep @job_name=N'$jobNameNew', @step_id=1 ,@proxy_name=N'$credentialName';"
            Invoke-DbaQuery -SqlInstance $conSqlInstanceForPowershellJobs -Database msdb -Query $sqlUpdateJob -EnableException
        }
        $sqlStartJob = "EXEC msdb.dbo.sp_start_job @job_name=N'$jobNameNew';"
        Invoke-DbaQuery -SqlInstance $conSqlInstanceForPowershellJobs -Database msdb -Query $sqlStartJob -EnableException
    }
}


# 22__CreateJobRunWhoIsActive
$stepName = '22__CreateJobRunWhoIsActive'
if($stepName -in $Steps2Execute) 
{
    $jobName = '(dba) Run-WhoIsActive'
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$RunWhoIsActiveJobFilePath = '$RunWhoIsActiveJobFilePath'"

    # Append HostName if Job Server is different    
    $jobNameNew = $jobName
    $sqlInstanceOnJobStep = "$SqlInstanceToBaselineWithOutPort"
    if($SqlInstanceToBaseline -ne $SqlInstanceForTsqlJobs) {
        $jobNameNew = "$jobName - $SqlInstanceToBaseline"
        $sqlInstanceOnJobStep = $SqlInstanceToBaseline
    }

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating job [$jobNameNew] on [$SqlInstanceForTsqlJobs].."
    $sqlRunWhoIsActive = [System.IO.File]::ReadAllText($RunWhoIsActiveJobFilePath)
    $sqlRunWhoIsActive = $sqlRunWhoIsActive.Replace('-S localhost', "-S `"$sqlInstanceOnJobStep`"")
    $sqlRunWhoIsActive = $sqlRunWhoIsActive.Replace('-d DBA', "-d `"$DbaDatabase`"")
    $sqlRunWhoIsActive = $sqlRunWhoIsActive.Replace("''some_dba_mail_id@gmail.com''", "''$($DbaGroupMailId -join ';')''" )
    if($isExpressEdition) {
        $sqlRunWhoIsActive = $sqlRunWhoIsActive.Replace('@retention_day = 7,', "@retention_day = 2,")
    }
    
    if($jobNameNew -ne $jobName) {
        $sqlRunWhoIsActive = $sqlRunWhoIsActive.Replace($jobName, $jobNameNew)
    }
    
    # If Express edition, and Task scheduler jobs are required
    if( ((-not [String]::IsNullOrEmpty($WindowsCredential)) -or ($ssnHostName -eq $env:COMPUTERNAME)) `
        -and ($isExpressEdition -or $ForceSetupOfTaskSchedulerJobs) -and ($ConfirmSetupOfTaskSchedulerJobs -or $ForceSetupOfTaskSchedulerJobs) )
    {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Extract Job command from '$RunWhoIsActiveJobFilePath'.."
        [String]$jobArguments = $null
        if($sqlRunWhoIsActive -match "@command=N'sqlcmd (?'arguments'.*)',") {
            $jobArguments = $Matches['arguments']
            $jobArguments = $jobArguments.Replace("''","'").Replace(";;",";")
        }

        if([String]::IsNullOrEmpty($jobArguments)) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Failure in extracting Job command in '$stepName'." | Write-Host -ForegroundColor Red
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly Resolve above error." | Write-Error
        }

        $jobDescription = "Run Job [$jobName] daily every 2 minutes"
        $timeIntervalMinutes = "00:02"
        $taskPath = '\DBA\'
        $parameters = @{
            Session = $ssn4PerfmonSetup
            ScriptBlock = {
                Param ($jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $SkipTsqlJobs)

                $currentTime = Get-Date
                $durationString = ($currentTime.AddMinutes(1)).ToString('HH:mm')

                $doStuff = New-ScheduledTaskAction -Execute 'sqlcmd' -Argument "$jobArguments -o `"$logsPath\$jobName.txt`""
                $timeToDoStuff = New-ScheduledTaskTrigger -Daily -DaysInterval 1 -RandomDelay "00:30" -At $durationString
                $timeToDoStuff.Repetition = $(New-ScheduledTaskTrigger -Once -RandomDelay "00:30" -At $durationString -RepetitionDuration "23:59" -RepetitionInterval $timeIntervalMinutes).Repetition
                $settingsForTheStuff = New-ScheduledTaskSettingsSet
                $runAsUser = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest
                $finalBuildOfTheStuff = New-ScheduledTask -Action $doStuff -Trigger $timeToDoStuff -Settings $settingsForTheStuff -Principal $runAsUser -Description $jobDescription

                $taskObj = @()
                try { $taskObj += Get-ScheduledTask -TaskName $jobName -TaskPath $taskPath -ErrorAction SilentlyContinue }
                catch { "Some Error" | Out-Null }

                $isCreated = $false
                if([String]::IsNullOrEmpty($taskObj)) {
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] created in Windows Task Scheduler."
                }
                elseif ($SkipTsqlJobs -eq $false) {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Drop/Recreate Job [$jobName] in Windows Task Scheduler.."
                    $taskObj | Unregister-ScheduledTask -Confirm:$false | Out-Null
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] dropped & recreated in Windows Task Scheduler."
                }
                else {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] already exists in Windows Task Scheduler."
                }

                if($isCreated) {
                    Start-ScheduledTask -TaskName $jobName -TaskPath $taskPath | Out-Null
                }
            }
            ArgumentList = $jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $SkipTsqlJobs
        }

        Invoke-Command @parameters -ErrorAction Stop
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "Kindly ensure windows Task Scheduler job [$($taskPath)$($jobName)] is running without Error." #| Write-Host -ForegroundColor Yellow
    }
    else # If not express edition
    {
        Invoke-DbaQuery -SqlInstance $conSqlInstanceForTsqlJobs -Database msdb -Query $sqlRunWhoIsActive -EnableException
    }
}


# 23__CreateJobRunBlitzIndex
$stepName = '23__CreateJobRunBlitzIndex'
if($stepName -in $Steps2Execute) 
{
    $jobName = '(dba) Run-BlitzIndex'
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$RunBlitzIndexJobFilePath = '$RunBlitzIndexJobFilePath'"

    # Append HostName if Job Server is different    
    $jobNameNew = $jobName
    $sqlInstanceOnJobStep = "$SqlInstanceToBaselineWithOutPort"
    if($SqlInstanceToBaseline -ne $SqlInstanceForTsqlJobs) {
        $jobNameNew = "$jobName - $SqlInstanceToBaseline"
        $sqlInstanceOnJobStep = $SqlInstanceToBaseline
    }

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating job [$jobNameNew] on [$SqlInstanceForTsqlJobs].."
    $sqlRunBlitzIndexJob = [System.IO.File]::ReadAllText($RunBlitzIndexJobFilePath)
    $sqlRunBlitzIndexJob = $sqlRunBlitzIndexJob.Replace('-S localhost', "-S `"$sqlInstanceOnJobStep`"")
    $sqlRunBlitzIndexJob = $sqlRunBlitzIndexJob.Replace('-d DBA', "-d `"$DbaDatabase`"")
    $sqlRunBlitzIndexJob = $sqlRunBlitzIndexJob.Replace("''DBA''", "''$DbaDatabase''" )
    $sqlRunBlitzIndexJob = $sqlRunBlitzIndexJob.Replace("'DBA'", "'$DbaDatabase'" )
    $sqlRunBlitzIndexJob = $sqlRunBlitzIndexJob.Replace("''some_dba_mail_id@gmail.com''", "''$($DbaGroupMailId -join ';')'';" )
    if($jobNameNew -ne $jobName) {
        $sqlRunBlitzIndexJob = $sqlRunBlitzIndexJob.Replace($jobName, $jobNameNew)
    }

    # If Express edition, and Task scheduler jobs are required
    if( ((-not [String]::IsNullOrEmpty($WindowsCredential)) -or ($ssnHostName -eq $env:COMPUTERNAME)) `
        -and ($isExpressEdition -or $ForceSetupOfTaskSchedulerJobs) -and ($ConfirmSetupOfTaskSchedulerJobs -or $ForceSetupOfTaskSchedulerJobs) )
    {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Extract Job command from '$RunBlitzIndexJobFilePath'.."
        [String]$jobArguments = $null
        if($sqlRunBlitzIndexJob -match "@command=N'sqlcmd (?'arguments'.*)',") {
            $jobArguments = $Matches['arguments']
            $jobArguments = $jobArguments.Replace("''","'").Replace(";;",";")
        }

        if([String]::IsNullOrEmpty($jobArguments)) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Failure in extracting Job command in '$stepName'." | Write-Host -ForegroundColor Red
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly Resolve above error." | Write-Error
        }

        $jobDescription = "Run Job [$jobName] daily at 7:00 pm"
        $timeIntervalMinutes = "00:00"
        $taskPath = '\DBA\'
        $parameters = @{
            Session = $ssn4PerfmonSetup
            ScriptBlock = {
                Param ($jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $SkipTsqlJobs)

                $currentTime = Get-Date
                #$durationString = ($currentTime.AddMinutes(1)).ToString('HH:mm')
                $durationString = '19:00'

                $doStuff = New-ScheduledTaskAction -Execute 'sqlcmd' -Argument "$jobArguments -o `"$logsPath\$jobName.txt`""
                $timeToDoStuff = New-ScheduledTaskTrigger -Daily -DaysInterval 1 -RandomDelay "00:30" -At $durationString
                #$timeToDoStuff.Repetition = $(New-ScheduledTaskTrigger -Once -RandomDelay "00:30" -At $durationString -RepetitionDuration "23:59" -RepetitionInterval $timeIntervalMinutes).Repetition
                $settingsForTheStuff = New-ScheduledTaskSettingsSet
                $runAsUser = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest
                $finalBuildOfTheStuff = New-ScheduledTask -Action $doStuff -Trigger $timeToDoStuff -Settings $settingsForTheStuff -Principal $runAsUser -Description $jobDescription

                $taskObj = @()
                try { $taskObj += Get-ScheduledTask -TaskName $jobName -TaskPath $taskPath -ErrorAction SilentlyContinue }
                catch { "Some Error" | Out-Null }

                $isCreated = $false
                if([String]::IsNullOrEmpty($taskObj)) {
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] created in Windows Task Scheduler."
                }
                elseif ($SkipTsqlJobs -eq $false) {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Drop/Recreate Job [$jobName] in Windows Task Scheduler.."
                    $taskObj | Unregister-ScheduledTask -Confirm:$false | Out-Null
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] dropped & recreated in Windows Task Scheduler."
                }
                else {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] already exists in Windows Task Scheduler."
                }

                if($isCreated) {
                    Start-ScheduledTask -TaskName $jobName -TaskPath $taskPath | Out-Null
                }
            }
            ArgumentList = $jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $SkipTsqlJobs
        }

        Invoke-Command @parameters -ErrorAction Stop
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "Kindly ensure windows Task Scheduler job [$($taskPath)$($jobName)] is running without Error." #| Write-Host -ForegroundColor Yellow
    }
    else # If not express edition
    {
        Invoke-DbaQuery -SqlInstance $conSqlInstanceForTsqlJobs -Database msdb -Query $sqlRunBlitzIndexJob -EnableException
    }
}


# 24__CreateJobRunBlitzIndexWeekly
$stepName = '24__CreateJobRunBlitzIndexWeekly'
if($stepName -in $Steps2Execute) 
{
    $jobName = '(dba) Run-BlitzIndex - Weekly'
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$RunBlitzIndexWeeklyJobFilePath = '$RunBlitzIndexWeeklyJobFilePath'"

    # Append HostName if Job Server is different    
    $jobNameNew = $jobName
    $sqlInstanceOnJobStep = "$SqlInstanceToBaselineWithOutPort"
    if($SqlInstanceToBaseline -ne $SqlInstanceForTsqlJobs) {
        $jobNameNew = "$jobName - $SqlInstanceToBaseline"
        $sqlInstanceOnJobStep = $SqlInstanceToBaseline
    }

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating job [$jobNameNew] on [$SqlInstanceForTsqlJobs].."
    $sqlRunBlitzIndexWeeklyJob = [System.IO.File]::ReadAllText($RunBlitzIndexWeeklyJobFilePath)
    $sqlRunBlitzIndexWeeklyJob = $sqlRunBlitzIndexWeeklyJob.Replace('-S localhost', "-S `"$sqlInstanceOnJobStep`"")
    $sqlRunBlitzIndexWeeklyJob = $sqlRunBlitzIndexWeeklyJob.Replace('-S "localhost"', "-S `"$sqlInstanceOnJobStep`"")
    $sqlRunBlitzIndexWeeklyJob = $sqlRunBlitzIndexWeeklyJob.Replace('-d DBA', "-d `"$DbaDatabase`"")
    $sqlRunBlitzIndexWeeklyJob = $sqlRunBlitzIndexWeeklyJob.Replace('-d "DBA"', "-d `"$DbaDatabase`"")
    $sqlRunBlitzIndexWeeklyJob = $sqlRunBlitzIndexWeeklyJob.Replace("''DBA''", "''$DbaDatabase''" )
    $sqlRunBlitzIndexWeeklyJob = $sqlRunBlitzIndexWeeklyJob.Replace("'DBA'", "'$DbaDatabase'" )
    $sqlRunBlitzIndexWeeklyJob = $sqlRunBlitzIndexWeeklyJob.Replace("''some_dba_mail_id@gmail.com''", "''$($DbaGroupMailId -join ';')'';" )
    if($jobNameNew -ne $jobName) {
        $sqlRunBlitzIndexWeeklyJob = $sqlRunBlitzIndexWeeklyJob.Replace($jobName, $jobNameNew)
    }

    # If Express edition, and Task scheduler jobs are required
    if( ((-not [String]::IsNullOrEmpty($WindowsCredential)) -or ($ssnHostName -eq $env:COMPUTERNAME)) `
        -and ($isExpressEdition -or $ForceSetupOfTaskSchedulerJobs) -and ($ConfirmSetupOfTaskSchedulerJobs -or $ForceSetupOfTaskSchedulerJobs) )
    {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Extract Job command from '$RunBlitzIndexWeeklyJobFilePath'.."
        [String]$jobArguments = $null
        if($sqlRunBlitzIndexWeeklyJob -match "@command=N'sqlcmd (?'arguments'.*)',") {
            $jobArguments = $Matches['arguments']
            $jobArguments = $jobArguments.Replace("''","'").Replace(";;",";")
        }

        if([String]::IsNullOrEmpty($jobArguments)) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Failure in extracting Job command in '$stepName'." | Write-Host -ForegroundColor Red
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly Resolve above error." | Write-Error
        }

        $jobDescription = "Run Job [$jobName] daily at 8:00 PM"
        $timeIntervalMinutes = "00:00"
        $taskPath = '\DBA\'
        $parameters = @{
            Session = $ssn4PerfmonSetup
            ScriptBlock = {
                Param ($jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $SkipTsqlJobs)

                $currentTime = Get-Date
                #$durationString = ($currentTime.AddMinutes(1)).ToString('HH:mm')
                $durationString = '20:00'

                $doStuff = New-ScheduledTaskAction -Execute 'sqlcmd' -Argument "$jobArguments -o `"$logsPath\$jobName.txt`""
                $timeToDoStuff = New-ScheduledTaskTrigger -Weekly -WeeksInterval 1 -DaysOfWeek Friday -At $durationString
                #$timeToDoStuff.Repetition = $(New-ScheduledTaskTrigger -Once -RandomDelay "00:30" -At $durationString -RepetitionDuration "23:59" -RepetitionInterval $timeIntervalMinutes).Repetition
                $settingsForTheStuff = New-ScheduledTaskSettingsSet
                $runAsUser = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest
                $finalBuildOfTheStuff = New-ScheduledTask -Action $doStuff -Trigger $timeToDoStuff -Settings $settingsForTheStuff -Principal $runAsUser -Description $jobDescription

                $taskObj = @()
                try { $taskObj += Get-ScheduledTask -TaskName $jobName -TaskPath $taskPath -ErrorAction SilentlyContinue }
                catch { "Some Error" | Out-Null }

                $isCreated = $false
                if([String]::IsNullOrEmpty($taskObj)) {
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] created in Windows Task Scheduler."
                }
                elseif ($SkipTsqlJobs -eq $false) {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Drop/Recreate Job [$jobName] in Windows Task Scheduler.."
                    $taskObj | Unregister-ScheduledTask -Confirm:$false | Out-Null
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] dropped & recreated in Windows Task Scheduler."
                }
                else {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] already exists in Windows Task Scheduler."
                }

                if($isCreated) {
                    Start-ScheduledTask -TaskName $jobName -TaskPath $taskPath | Out-Null
                }
            }
            ArgumentList = $jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $SkipTsqlJobs
        }

        Invoke-Command @parameters -ErrorAction Stop
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "Kindly ensure windows Task Scheduler job [$($taskPath)$($jobName)] is running without Error." #| Write-Host -ForegroundColor Yellow
    }
    else # If not express edition
    {
        Invoke-DbaQuery -SqlInstance $conSqlInstanceForTsqlJobs -Database msdb -Query $sqlRunBlitzIndexWeeklyJob -EnableException
    }
}


# 25__CreateJobCollectMemoryClerks
$stepName = '25__CreateJobCollectMemoryClerks'
if($stepName -in $Steps2Execute) 
{
    $jobName = '(dba) Collect-MemoryClerks'
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$CollectMemoryClerksJobFilePath = '$CollectMemoryClerksJobFilePath'"

    # Append HostName if Job Server is different    
    $jobNameNew = $jobName
    $sqlInstanceOnJobStep = "$SqlInstanceToBaselineWithOutPort"
    if($SqlInstanceToBaseline -ne $SqlInstanceForTsqlJobs) {
        $jobNameNew = "$jobName - $SqlInstanceToBaseline"
        $sqlInstanceOnJobStep = $SqlInstanceToBaseline
    }

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating job [$jobNameNew] on [$SqlInstanceForTsqlJobs].."
    $sqlCreateJobCollectMemoryClerks = [System.IO.File]::ReadAllText($CollectMemoryClerksJobFilePath)
    $sqlCreateJobCollectMemoryClerks = $sqlCreateJobCollectMemoryClerks.Replace('-S localhost', "-S `"$sqlInstanceOnJobStep`"")
    $sqlCreateJobCollectMemoryClerks = $sqlCreateJobCollectMemoryClerks.Replace('-d DBA', "-d `"$DbaDatabase`"")
    $sqlCreateJobCollectMemoryClerks = $sqlCreateJobCollectMemoryClerks.Replace("''some_dba_mail_id@gmail.com''", "''$($DbaGroupMailId -join ';')'';" )
    if($jobNameNew -ne $jobName) {
        $sqlCreateJobCollectMemoryClerks = $sqlCreateJobCollectMemoryClerks.Replace($jobName, $jobNameNew)
    }

    # If Express edition, and Task scheduler jobs are required
    if( ((-not [String]::IsNullOrEmpty($WindowsCredential)) -or ($ssnHostName -eq $env:COMPUTERNAME)) `
        -and ($isExpressEdition -or $ForceSetupOfTaskSchedulerJobs) -and ($ConfirmSetupOfTaskSchedulerJobs -or $ForceSetupOfTaskSchedulerJobs) )
    {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Extract Job command from '$CollectMemoryClerksJobFilePath'.."
        [String]$jobArguments = $null
        if($sqlCreateJobCollectMemoryClerks -match "@command=N'sqlcmd (?'arguments'.*)',") {
            $jobArguments = $Matches['arguments']
            $jobArguments = $jobArguments.Replace("''","'").Replace(";;",";")
        }

        if([String]::IsNullOrEmpty($jobArguments)) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Failure in extracting Job command in '$stepName'." | Write-Host -ForegroundColor Red
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly Resolve above error." | Write-Error
        }

        $jobDescription = "Run Job [$jobName] daily every 2 minutes"
        $timeIntervalMinutes = "00:02"
        $taskPath = '\DBA\'
        $parameters = @{
            Session = $ssn4PerfmonSetup
            ScriptBlock = {
                Param ($jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $SkipTsqlJobs)

                $currentTime = Get-Date
                $durationString = ($currentTime.AddMinutes(1)).ToString('HH:mm')

                $doStuff = New-ScheduledTaskAction -Execute 'sqlcmd' -Argument "$jobArguments -o `"$logsPath\$jobName.txt`""
                $timeToDoStuff = New-ScheduledTaskTrigger -Daily -DaysInterval 1 -RandomDelay "00:30" -At $durationString
                $timeToDoStuff.Repetition = $(New-ScheduledTaskTrigger -Once -RandomDelay "00:30" -At $durationString -RepetitionDuration "23:59" -RepetitionInterval $timeIntervalMinutes).Repetition
                $settingsForTheStuff = New-ScheduledTaskSettingsSet
                $runAsUser = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest
                $finalBuildOfTheStuff = New-ScheduledTask -Action $doStuff -Trigger $timeToDoStuff -Settings $settingsForTheStuff -Principal $runAsUser -Description $jobDescription

                $taskObj = @()
                try { $taskObj += Get-ScheduledTask -TaskName $jobName -TaskPath $taskPath -ErrorAction SilentlyContinue }
                catch { "Some Error" | Out-Null }

                $isCreated = $false
                if([String]::IsNullOrEmpty($taskObj)) {
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] created in Windows Task Scheduler."
                }
                elseif ($SkipTsqlJobs -eq $false) {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Drop/Recreate Job [$jobName] in Windows Task Scheduler.."
                    $taskObj | Unregister-ScheduledTask -Confirm:$false | Out-Null
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] dropped & recreated in Windows Task Scheduler."
                }
                else {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] already exists in Windows Task Scheduler."
                }

                if($isCreated) {
                    Start-ScheduledTask -TaskName $jobName -TaskPath $taskPath | Out-Null
                }
            }
            ArgumentList = $jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $SkipTsqlJobs
        }

        Invoke-Command @parameters -ErrorAction Stop
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "Kindly ensure windows Task Scheduler job [$($taskPath)$($jobName)] is running without Error." #| Write-Host -ForegroundColor Yellow
    }
    else # If not express edition
    {
        Invoke-DbaQuery -SqlInstance $conSqlInstanceForTsqlJobs -Database msdb -Query $sqlCreateJobCollectMemoryClerks -EnableException
    }
}


# 26__CreateJobCheckSQLAgentJobs
$stepName = '26__CreateJobCheckSQLAgentJobs'
if($stepName -in $Steps2Execute) 
{
    $jobName = '(dba) Check-SQLAgentJobs'
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$CheckSQLAgentJobsJobFilePath = '$CheckSQLAgentJobsJobFilePath'"

    # Append HostName if Job Server is different    
    $jobNameNew = $jobName
    $sqlInstanceOnJobStep = "$SqlInstanceToBaselineWithOutPort"
    if($SqlInstanceToBaseline -ne $SqlInstanceForTsqlJobs) {
        $jobNameNew = "$jobName - $SqlInstanceToBaseline"
        $sqlInstanceOnJobStep = $SqlInstanceToBaseline
    }

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating job [$jobNameNew] on [$SqlInstanceForTsqlJobs].."
    $sqlCreateJobCheckSQLAgentJobs = [System.IO.File]::ReadAllText($CheckSQLAgentJobsJobFilePath)
    $sqlCreateJobCheckSQLAgentJobs = $sqlCreateJobCheckSQLAgentJobs.Replace('-S localhost', "-S `"$sqlInstanceOnJobStep`"")
    $sqlCreateJobCheckSQLAgentJobs = $sqlCreateJobCheckSQLAgentJobs.Replace('-d DBA', "-d `"$DbaDatabase`"")
    $sqlCreateJobCheckSQLAgentJobs = $sqlCreateJobCheckSQLAgentJobs.Replace("''some_dba_mail_id@gmail.com''", "''$($DbaGroupMailId -join ';')'';" )
    if($jobNameNew -ne $jobName) {
        $sqlCreateJobCheckSQLAgentJobs = $sqlCreateJobCheckSQLAgentJobs.Replace($jobName, $jobNameNew)
    }

    # If Express edition, and Task scheduler jobs are required
    if( ((-not [String]::IsNullOrEmpty($WindowsCredential)) -or ($ssnHostName -eq $env:COMPUTERNAME)) `
        -and ($isExpressEdition -or $ForceSetupOfTaskSchedulerJobs) -and ($ConfirmSetupOfTaskSchedulerJobs -or $ForceSetupOfTaskSchedulerJobs) )
    {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Extract Job command from '$CheckSQLAgentJobsJobFilePath'.."
        [String]$jobArguments = $null
        if($sqlCreateJobCheckSQLAgentJobs -match "@command=N'sqlcmd (?'arguments'.*)',") {
            $jobArguments = $Matches['arguments']
            $jobArguments = $jobArguments.Replace("''","'").Replace(";;",";")
        }

        if([String]::IsNullOrEmpty($jobArguments)) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Failure in extracting Job command in '$stepName'." | Write-Host -ForegroundColor Red
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly Resolve above error." | Write-Error
        }

        $jobDescription = "Run Job [$jobName] daily every 5 minutes"
        $timeIntervalMinutes = "00:05"
        $taskPath = '\DBA\'
        $parameters = @{
            Session = $ssn4PerfmonSetup
            ScriptBlock = {
                Param ($jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $SkipTsqlJobs)

                $currentTime = Get-Date
                $durationString = ($currentTime.AddMinutes(1)).ToString('HH:mm')

                $doStuff = New-ScheduledTaskAction -Execute 'sqlcmd' -Argument "$jobArguments -o `"$logsPath\$jobName.txt`""
                $timeToDoStuff = New-ScheduledTaskTrigger -Daily -DaysInterval 1 -RandomDelay "00:30" -At $durationString
                $timeToDoStuff.Repetition = $(New-ScheduledTaskTrigger -Once -RandomDelay "00:30" -At $durationString -RepetitionDuration "23:59" -RepetitionInterval $timeIntervalMinutes).Repetition
                $settingsForTheStuff = New-ScheduledTaskSettingsSet
                $runAsUser = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest
                $finalBuildOfTheStuff = New-ScheduledTask -Action $doStuff -Trigger $timeToDoStuff -Settings $settingsForTheStuff -Principal $runAsUser -Description $jobDescription

                $taskObj = @()
                try { $taskObj += Get-ScheduledTask -TaskName $jobName -TaskPath $taskPath -ErrorAction SilentlyContinue }
                catch { "Some Error" | Out-Null }

                $isCreated = $false
                if([String]::IsNullOrEmpty($taskObj)) {
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] created in Windows Task Scheduler."
                }
                elseif ($SkipTsqlJobs -eq $false) {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Drop/Recreate Job [$jobName] in Windows Task Scheduler.."
                    $taskObj | Unregister-ScheduledTask -Confirm:$false | Out-Null
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] dropped & recreated in Windows Task Scheduler."
                }
                else {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] already exists in Windows Task Scheduler."
                }

                if($isCreated) {
                    Start-ScheduledTask -TaskName $jobName -TaskPath $taskPath | Out-Null
                }
            }
            ArgumentList = $jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $SkipTsqlJobs
        }

        Invoke-Command @parameters -ErrorAction Stop
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "Kindly ensure windows Task Scheduler job [$($taskPath)$($jobName)] is running without Error." #| Write-Host -ForegroundColor Yellow
    }
    else # If not express edition
    {
        Invoke-DbaQuery -SqlInstance $conSqlInstanceForTsqlJobs -Database msdb -Query $sqlCreateJobCheckSQLAgentJobs -EnableException
    }
}


# 27__CreateJobUpdateSqlServerVersions
$stepName = '27__CreateJobUpdateSqlServerVersions'
if($stepName -in $Steps2Execute -and $SqlInstanceToBaseline -eq $InventoryServer) 
{
    $jobName = '(dba) Update-SqlServerVersions'
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$UpdateSqlServerVersionsJobFilePath = '$UpdateSqlServerVersionsJobFilePath'"
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating job [$jobName] on [$SqlInstanceToBaseline].."
    $sqlUpdateSqlServerVersions = [System.IO.File]::ReadAllText($UpdateSqlServerVersionsJobFilePath).Replace('-SqlInstance localhost', "-SqlInstance `"$SqlInstanceToBaselineWithOutPort`"")

    if($RemoteSQLMonitorPath -ne 'C:\SQLMonitor') {
        $sqlUpdateSqlServerVersions = $sqlUpdateSqlServerVersions.Replace('C:\SQLMonitor', $RemoteSQLMonitorPath)
    }

    # If Express edition, and Task scheduler jobs are required
    if( ((-not [String]::IsNullOrEmpty($WindowsCredential)) -or ($ssnHostName -eq $env:COMPUTERNAME)) `
        -and ($isExpressEdition -or $ForceSetupOfTaskSchedulerJobs) -and ($ConfirmSetupOfTaskSchedulerJobs -or $ForceSetupOfTaskSchedulerJobs) )
    {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Extract Job command from '$UpdateSqlServerVersionsJobFilePath'.."
        [String]$jobArguments = $null
        if($sqlUpdateSqlServerVersions -match "@command=N'powershell.exe(?'arguments'.*)',") {
            $jobArguments = $Matches['arguments']
        }

        if([String]::IsNullOrEmpty($jobArguments)) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Failure in extracting Job command in '$stepName'." | Write-Host -ForegroundColor Red
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly Resolve above error." | Write-Error
        }

        $jobDescription = "Run Job [$jobName] daily every 1 minutes"
        $timeIntervalMinutes = "00:00"
        $taskPath = '\DBA\'
        $parameters = @{
            Session = $ssn4PerfmonSetup
            ScriptBlock = {
                Param ($jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $DropCreatePowerShellJobs)

                $currentTime = Get-Date
                $durationString = ($currentTime.AddMinutes(1)).ToString('HH:mm')

                $doStuff = New-ScheduledTaskAction -Execute 'powershell' -Argument "$jobArguments *> '$logsPath\$jobName.txt'"
                $timeToDoStuff = New-ScheduledTaskTrigger -Weekly -WeeksInterval 1 -DaysOfWeek Wednesday, Friday  -At $durationString
                #$timeToDoStuff.Repetition = $(New-ScheduledTaskTrigger -Once -RandomDelay "00:30" -At $durationString -RepetitionDuration "23:59" -RepetitionInterval $timeIntervalMinutes).Repetition
                $settingsForTheStuff = New-ScheduledTaskSettingsSet
                $runAsUser = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest
                $finalBuildOfTheStuff = New-ScheduledTask -Action $doStuff -Trigger $timeToDoStuff -Settings $settingsForTheStuff -Principal $runAsUser -Description $jobDescription

                $taskObj = @()
                try { $taskObj += Get-ScheduledTask -TaskName $jobName -TaskPath $taskPath -ErrorAction SilentlyContinue }
                catch { "Some Error" | Out-Null }

                $isCreated = $false
                if([String]::IsNullOrEmpty($taskObj)) {
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] created in Windows Task Scheduler."
                }
                elseif ($DropCreatePowerShellJobs) {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Drop/Recreate Job [$jobName] in Windows Task Scheduler.."
                    $taskObj | Unregister-ScheduledTask -Confirm:$false | Out-Null
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] dropped & recreated in Windows Task Scheduler."
                }
                else {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] already exists in Windows Task Scheduler."
                }

                if($isCreated) {
                    Start-ScheduledTask -TaskName $jobName -TaskPath $taskPath | Out-Null
                }
            }
            ArgumentList = $jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $DropCreatePowerShellJobs
        }

        Invoke-Command @parameters -ErrorAction Stop
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "Kindly ensure windows Task Scheduler job [$($taskPath)$($jobName)] is running without Error." #| Write-Host -ForegroundColor Yellow
    }
    else # If not express edition
    {
        if($DropCreatePowerShellJobs) {
            $tsqlSSMSValidation = "and APP_NAME() = 'Microsoft SQL Server Management Studio - Query'"
            $sqlUpdateSqlServerVersions = $sqlUpdateSqlServerVersions.Replace($tsqlSSMSValidation, "--$tsqlSSMSValidation")
        }
        Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database msdb -Query $sqlUpdateSqlServerVersions -EnableException

        if($requireProxy) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Update job [$jobName] to run under proxy [$credentialName].."
            $sqlUpdateJob = "EXEC msdb.dbo.sp_update_jobstep @job_name=N'$jobName', @step_id=1 ,@proxy_name=N'$credentialName';"
            Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database msdb -Query $sqlUpdateJob -EnableException
        }
        $sqlStartJob = "EXEC msdb.dbo.sp_start_job @job_name=N'$jobName';"
        Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database msdb -Query $sqlStartJob -EnableException
    }
}


# 28__CreateJobCheckInstanceAvailability
$stepName = '28__CreateJobCheckInstanceAvailability'
if($stepName -in $Steps2Execute -and $SqlInstanceToBaseline -eq $InventoryServer) 
{
    $jobName = '(dba) Check-InstanceAvailability'
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$CheckInstanceAvailabilityJobFilePath = '$CheckInstanceAvailabilityJobFilePath'"
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating job [$jobName] on [$SqlInstanceToBaseline].."
    $sqlGetInstanceAvailability = [System.IO.File]::ReadAllText($CheckInstanceAvailabilityJobFilePath)
    $sqlGetInstanceAvailability = $sqlGetInstanceAvailability.Replace('-InventoryServer localhost', "-InventoryServer `"$SqlInstanceToBaselineWithOutPort`"")
    $sqlGetInstanceAvailability = $sqlGetInstanceAvailability.Replace('-InventoryDatabase DBA', "-InventoryDatabase `"$InventoryDatabase`"")

    if($RemoteSQLMonitorPath -ne 'C:\SQLMonitor') {
        $sqlGetInstanceAvailability = $sqlGetInstanceAvailability.Replace('C:\SQLMonitor', $RemoteSQLMonitorPath)
    }
    
    # If Express edition, and Task scheduler jobs are required
    if( ((-not [String]::IsNullOrEmpty($WindowsCredential)) -or ($ssnHostName -eq $env:COMPUTERNAME)) `
        -and ($isExpressEdition -or $ForceSetupOfTaskSchedulerJobs) -and ($ConfirmSetupOfTaskSchedulerJobs -or $ForceSetupOfTaskSchedulerJobs) )
    {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Extract Job command from '$CheckInstanceAvailabilityJobFilePath'.."
        [String]$jobArguments = $null
        if($sqlGetInstanceAvailability -match "@command=N'powershell.exe(?'arguments'.*)',") {
            $jobArguments = $Matches['arguments']
        }

        if([String]::IsNullOrEmpty($jobArguments)) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Failure in extracting Job command in '$stepName'." | Write-Host -ForegroundColor Red
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly Resolve above error." | Write-Error
        }

        $jobDescription = "Run Job [$jobName] daily every 2 minutes"
        $timeIntervalMinutes = "00:02"
        $taskPath = '\DBA\'
        $parameters = @{
            Session = $ssn4PerfmonSetup
            ScriptBlock = {
                Param ($jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $DropCreatePowerShellJobs)

                $currentTime = Get-Date
                $durationString = ($currentTime.AddMinutes(1)).ToString('HH:mm')

                $doStuff = New-ScheduledTaskAction -Execute 'powershell' -Argument "$jobArguments *> '$logsPath\$jobName.txt'"
                $timeToDoStuff = New-ScheduledTaskTrigger -Daily -DaysInterval 1 -RandomDelay "00:30" -At $durationString
                $timeToDoStuff.Repetition = $(New-ScheduledTaskTrigger -Once -RandomDelay "00:30" -At $durationString -RepetitionDuration "23:59" -RepetitionInterval $timeIntervalMinutes).Repetition
                $settingsForTheStuff = New-ScheduledTaskSettingsSet
                $runAsUser = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest
                $finalBuildOfTheStuff = New-ScheduledTask -Action $doStuff -Trigger $timeToDoStuff -Settings $settingsForTheStuff -Principal $runAsUser -Description $jobDescription

                $taskObj = @()
                try { $taskObj += Get-ScheduledTask -TaskName $jobName -TaskPath $taskPath -ErrorAction SilentlyContinue }
                catch { "Some Error" | Out-Null }

                $isCreated = $false
                if([String]::IsNullOrEmpty($taskObj)) {
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] created in Windows Task Scheduler."
                }
                elseif ($DropCreatePowerShellJobs) {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Drop/Recreate Job [$jobName] in Windows Task Scheduler.."
                    $taskObj | Unregister-ScheduledTask -Confirm:$false | Out-Null
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] dropped & recreated in Windows Task Scheduler."
                }
                else {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] already exists in Windows Task Scheduler."
                }

                if($isCreated) {
                    Start-ScheduledTask -TaskName $jobName -TaskPath $taskPath | Out-Null
                }
            }
            ArgumentList = $jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $DropCreatePowerShellJobs
        }

        Invoke-Command @parameters -ErrorAction Stop
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "Kindly ensure windows Task Scheduler job [$($taskPath)$($jobName)] is running without Error." #| Write-Host -ForegroundColor Yellow
    }
    else # If not express edition
    {
        if($DropCreatePowerShellJobs) {
            $tsqlSSMSValidation = "and APP_NAME() = 'Microsoft SQL Server Management Studio - Query'"
            $sqlGetInstanceAvailability = $sqlGetInstanceAvailability.Replace($tsqlSSMSValidation, "--$tsqlSSMSValidation")
        }
        Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database msdb -Query $sqlGetInstanceAvailability -EnableException

        if($requireProxy) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Update job [$jobName] to run under proxy [$credentialName].."
            $sqlUpdateJob = "EXEC msdb.dbo.sp_update_jobstep @job_name=N'$jobName', @step_id=1 ,@proxy_name=N'$credentialName';"
            Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database msdb -Query $sqlUpdateJob -EnableException
        }
        $sqlStartJob = "EXEC msdb.dbo.sp_start_job @job_name=N'$jobName';"
        Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database msdb -Query $sqlStartJob -EnableException
    }
}


# 29__CreateJobGetAllServerInfo
$stepName = '29__CreateJobGetAllServerInfo'
if($stepName -in $Steps2Execute -and $SqlInstanceToBaseline -eq $InventoryServer) 
{
    $jobName = '(dba) Get-AllServerInfo'
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$GetAllServerInfoJobFilePath = '$GetAllServerInfoJobFilePath'"

    # Append HostName if Job Server is different    
    $jobNameNew = $jobName
    $sqlInstanceOnJobStep = "$SqlInstanceToBaselineWithOutPort"
    if($SqlInstanceToBaseline -ne $SqlInstanceForTsqlJobs) {
        $jobNameNew = "$jobName - $SqlInstanceToBaseline"
        $sqlInstanceOnJobStep = $SqlInstanceToBaseline
    }

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating job [$jobNameNew] on [$SqlInstanceForTsqlJobs].."
    $sqlGetAllServerInfoJobFileText = [System.IO.File]::ReadAllText($GetAllServerInfoJobFilePath)
    $sqlGetAllServerInfoJobFileText = $sqlGetAllServerInfoJobFileText.Replace('-S localhost', "-S `"$sqlInstanceOnJobStep`"")
    $sqlGetAllServerInfoJobFileText = $sqlGetAllServerInfoJobFileText.Replace('-d DBA', "-d `"$DbaDatabase`"")
    $sqlGetAllServerInfoJobFileText = $sqlGetAllServerInfoJobFileText.Replace("''some_dba_mail_id@gmail.com''", "''$($DbaGroupMailId -join ';')''" )
    if($jobNameNew -ne $jobName) {
        $sqlGetAllServerInfoJobFileText = $sqlGetAllServerInfoJobFileText.Replace($jobName, $jobNameNew)
    }


    # If Express edition, and Task scheduler jobs are required
    if( ((-not [String]::IsNullOrEmpty($WindowsCredential)) -or ($ssnHostName -eq $env:COMPUTERNAME)) `
        -and ($isExpressEdition -or $ForceSetupOfTaskSchedulerJobs) -and ($ConfirmSetupOfTaskSchedulerJobs -or $ForceSetupOfTaskSchedulerJobs) )
    {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Extract Job command from '$GetAllServerInfoJobFilePath'.."
        [System.Collections.ArrayList]$jobArguments = @()
        foreach($line in $($sqlGetAllServerInfoJobFileText -split "`n")) 
        {
            if($line -match "@command=N'sqlcmd (?'arguments'.*)',") {
                $command = $Matches['arguments']
                $command = $command.Replace("''","'").Replace(";;",";")
                $jobArguments.Add($command) | Out-Null
            }
        }

        if($jobArguments.Count -eq 0) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Failure in extracting Job command in '$stepName'." | Write-Host -ForegroundColor Red
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly Resolve above error." | Write-Error
        }

        $jobDescription = "Run Job [$jobName] daily every 20 seconds"
        $timeIntervalMinutes = "00:01"
        $taskPath = '\DBA\'
        $parameters = @{
            Session = $ssn4PerfmonSetup
            ScriptBlock = {
                Param ($jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $SkipTsqlJobs)

                $currentTime = Get-Date
                $durationString = ($currentTime.AddMinutes(1)).ToString('HH:mm')

                $doStuff = @()
                $counter = 1
                foreach($command in $jobArguments) {
                    $doStuff += $(New-ScheduledTaskAction -Execute 'sqlcmd' -Argument "$command -o `"$logsPath\$jobName-$counter.txt`"")
                    $counter += 1
                }
                $timeToDoStuff = New-ScheduledTaskTrigger -Daily -DaysInterval 1 -RandomDelay "00:30" -At $durationString
                $timeToDoStuff.Repetition = $(New-ScheduledTaskTrigger -Once -RandomDelay "00:30" -At $durationString -RepetitionDuration "23:59" -RepetitionInterval $timeIntervalMinutes).Repetition
                $settingsForTheStuff = New-ScheduledTaskSettingsSet
                $runAsUser = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest
                $finalBuildOfTheStuff = New-ScheduledTask -Action $doStuff -Trigger $timeToDoStuff -Settings $settingsForTheStuff -Principal $runAsUser -Description $jobDescription

                $taskObj = @()
                try { $taskObj += Get-ScheduledTask -TaskName $jobName -TaskPath $taskPath -ErrorAction SilentlyContinue }
                catch { "Some Error" | Out-Null }

                $isCreated = $false
                if([String]::IsNullOrEmpty($taskObj)) {
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] created in Windows Task Scheduler."
                }
                elseif ($SkipTsqlJobs -eq $false) {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Drop/Recreate Job [$jobName] in Windows Task Scheduler.."
                    $taskObj | Unregister-ScheduledTask -Confirm:$false | Out-Null
                    Register-ScheduledTask -TaskName $jobName -InputObject $finalBuildOfTheStuff -TaskPath $taskPath | Out-Null
                    $isCreated = $true
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] dropped & recreated in Windows Task Scheduler."
                }
                else {
                    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Job [$jobName] already exists in Windows Task Scheduler."
                }

                if($isCreated) {
                    Start-ScheduledTask -TaskName $jobName -TaskPath $taskPath | Out-Null
                }
            }
            ArgumentList = $jobName, $jobDescription, $jobArguments, $timeIntervalMinutes, $taskPath, $logsPath, $SkipTsqlJobs
        }

        Invoke-Command @parameters -ErrorAction Stop
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'WARNING:', "Kindly ensure windows Task Scheduler job [$($taskPath)$($jobName)] is running without Error."
    }
    else # If not express edition
    {
        Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database msdb -Query $sqlGetAllServerInfoJobFileText -EnableException
    }
}


# 30__WhoIsActivePartition
$stepName = '30__WhoIsActivePartition'
if($stepName -in $Steps2Execute -and $IsNonPartitioned -eq $false) {
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$WhoIsActivePartitionFilePath = '$WhoIsActivePartitionFilePath'"
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "ALTER [dbo].[WhoIsActive] table to partitioned table on [$SqlInstanceToBaseline].."
    $sqlPartitionWhoIsActive = [System.IO.File]::ReadAllText($WhoIsActivePartitionFilePath).Replace("[DBA]", "[$DbaDatabase]")
    
    $whoIsActiveExists = @()
    $loopStartTime = Get-Date
    $sleepDurationSeconds = 30
    $loopTotalDurationThresholdSeconds = 300    
    
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Check for existance of table [dbo].[WhoIsActive] on [$SqlInstanceToBaseline].."
    while ($whoIsActiveExists.Count -eq 0 -and $( (New-TimeSpan $loopStartTime $(Get-Date)).TotalSeconds -le $loopTotalDurationThresholdSeconds ) )
    {
        $whoIsActiveExists += Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase `
                                    -Query "if OBJECT_ID('dbo.WhoIsActive') is not null select OBJECT_ID('dbo.WhoIsActive') as WhoIsActiveObjectID" -EnableException

        if($whoIsActiveExists.Count -eq 0) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Wait for $sleepDurationSeconds seconds as table dbo.WhoIsActive still does not exist.."
            Start-Sleep -Seconds $sleepDurationSeconds
        }
    }

    if($whoIsActiveExists.Count -eq 0) {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Table [dbo].[WhoIsActive] does not exist." | Write-Host -ForegroundColor Red
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly ensure job [(dba) Run-WhoIsActive] is running successfully." | Write-Host -ForegroundColor Red
        
        "STOP here, and fix above issue." | Write-Error
    }
    else {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Seems table exists now. Convert [dbo].[WhoIsActive] into partitioned table.."
        Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -Query $sqlPartitionWhoIsActive -EnableException
    }
}


# 31__BlitzIndexPartition
$stepName = '31__BlitzIndexPartition'
if($stepName -in $Steps2Execute -and $IsNonPartitioned -eq $false) {
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$BlitzIndexPartitionFilePath = '$BlitzIndexPartitionFilePath'"
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "ALTER [dbo].[BlitzIndex] table to partitioned table on [$SqlInstanceToBaseline].."
    $sqlPartitionBlitzIndex = [System.IO.File]::ReadAllText($BlitzIndexPartitionFilePath).Replace("[DBA]", "[$DbaDatabase]")
    
    $BlitzIndexExists = @()
    $loopStartTime = Get-Date
    $sleepDurationSeconds = 30
    $loopTotalDurationThresholdSeconds = 300    
    
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Check for existance of table [dbo].[BlitzIndex] on [$SqlInstanceToBaseline].."
    while ($BlitzIndexExists.Count -eq 0 -and $( (New-TimeSpan $loopStartTime $(Get-Date)).TotalSeconds -le $loopTotalDurationThresholdSeconds ) )
    {
        $BlitzIndexExists += Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase `
                                    -Query "if OBJECT_ID('dbo.BlitzIndex') is not null select OBJECT_ID('dbo.BlitzIndex') as BlitzIndexObjectID" -EnableException

        if($BlitzIndexExists.Count -eq 0) {
            "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Wait for $sleepDurationSeconds seconds as table dbo.BlitzIndex still does not exist.."
            Start-Sleep -Seconds $sleepDurationSeconds
        }
    }

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Seems table exists now. Convert [dbo].[BlitzIndex] into partitioned table.."
    Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -Query $sqlPartitionBlitzIndex -EnableException
}


# 32__EnablePageCompression
$stepName = '32__EnablePageCompression'
if( ($stepName -in $Steps2Execute) -and ($SkipPageCompression -eq $false) -and $IsCompressionSupported) {
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."

    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Execute procedure [usp_enable_page_compression] on [$SqlInstanceToBaseline].."
    $sqlExecuteUspEnablePageCompression = "exec dbo.usp_enable_page_compression;"
    Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -Query $sqlExecuteUspEnablePageCompression -EnableException
}


# 33__GrafanaLogin
$stepName = '33__GrafanaLogin'
if($stepName -in $Steps2Execute) {
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$GrafanaLoginFilePath = '$GrafanaLoginFilePath'"
    #"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating All Objects in [$DbaDatabase] database.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Create [grafana] login & user with permissions on objects.."
    $sqlGrafanaLogin = [System.IO.File]::ReadAllText($GrafanaLoginFilePath).Replace("[DBA]", "[$DbaDatabase]")
    Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database master -Query $sqlGrafanaLogin -EnableException
}


# 34__LinkedServerOnInventory
$stepName = '34__LinkedServerOnInventory'
if($stepName -in $Steps2Execute -and $SqlInstanceToBaselineWithOutPort -ne $InventoryServerWithOutPort) {
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$LinkedServerOnInventoryFilePath = '$LinkedServerOnInventoryFilePath'"
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating linked server for [$SqlInstanceToBaseline] on [$InventoryServer].."
    #$sqlLinkedServerOnInventory = [System.IO.File]::ReadAllText($LinkedServerOnInventoryFilePath).Replace("'YourSqlInstanceNameHere'", "'$SqlInstanceToBaseline'")
    $sqlLinkedServerOnInventory = [System.IO.File]::ReadAllText($LinkedServerOnInventoryFilePath)
    $sqlLinkedServerOnInventory = $sqlLinkedServerOnInventory.Replace("@server = N'YourSqlInstanceNameHere'", "@server = N'$SqlInstanceToBaselineWithOutPort'")
    $sqlLinkedServerOnInventory = $sqlLinkedServerOnInventory.Replace("@server=N'YourSqlInstanceNameHere'", "@server=N'$SqlInstanceToBaselineWithOutPort'")
    $sqlLinkedServerOnInventory = $sqlLinkedServerOnInventory.Replace("@rmtsrvname=N'YourSqlInstanceNameHere'", "@rmtsrvname=N'$SqlInstanceToBaselineWithOutPort'")
    $sqlLinkedServerOnInventory = $sqlLinkedServerOnInventory.Replace("@datasrc=N'YourSqlInstanceNameHere'", "@datasrc=N'$SqlInstanceToBaseline'")
    $sqlLinkedServerOnInventory = $sqlLinkedServerOnInventory.Replace("@catalog=N'DBA'", "@catalog=N'$DbaDatabase'")
    
    $dbaLinkedServer = @()
    $dbaLinkedServer += Get-DbaLinkedServer -SqlInstance $conInventoryServer -LinkedServer $SqlInstanceToBaselineWithOutPort
    if($dbaLinkedServer.Count -eq 0) {
        Invoke-DbaQuery -SqlInstance $conInventoryServer -Database master -Query $sqlLinkedServerOnInventory -EnableException
    } else {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Linked server for [$SqlInstanceToBaseline] on [$InventoryServer] already exists.."
    }
}


# 35__LinkedServerForDataDestinationInstance
$stepName = '35__LinkedServerForDataDestinationInstance'
if( ($stepName -in $Steps2Execute) -and ($SqlInstanceToBaseline -ne $SqlInstanceAsDataDestination) )
{
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "`$LinkedServerOnInventoryFilePath = '$LinkedServerOnInventoryFilePath'"

    $sqlLinkedServerForDataDestinationInstance = [System.IO.File]::ReadAllText($LinkedServerOnInventoryFilePath)
    $sqlLinkedServerForDataDestinationInstance = $sqlLinkedServerForDataDestinationInstance.Replace("@server = N'YourSqlInstanceNameHere'", "@server = N'$SqlInstanceAsDataDestinationWithOutPort'")
    $sqlLinkedServerForDataDestinationInstance = $sqlLinkedServerForDataDestinationInstance.Replace("@server=N'YourSqlInstanceNameHere'", "@server=N'$SqlInstanceAsDataDestinationWithOutPort'")
    $sqlLinkedServerForDataDestinationInstance = $sqlLinkedServerForDataDestinationInstance.Replace("@rmtsrvname=N'YourSqlInstanceNameHere'", "@rmtsrvname=N'$SqlInstanceAsDataDestinationWithOutPort'")
    $sqlLinkedServerForDataDestinationInstance = $sqlLinkedServerForDataDestinationInstance.Replace("@datasrc=N'YourSqlInstanceNameHere'", "@datasrc=N'$SqlInstanceAsDataDestination'")
    $sqlLinkedServerForDataDestinationInstance = $sqlLinkedServerForDataDestinationInstance.Replace("@catalog=N'DBA'", "@catalog=N'$DbaDatabase'")
    
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Checking if linked server already exists.."
    $dbaLinkedServer = @()
    $dbaLinkedServer += Get-DbaLinkedServer -SqlInstance $conSqlInstanceToBaseline -LinkedServer $SqlInstanceAsDataDestinationWithOutPort -EnableException
    if($dbaLinkedServer.Count -eq 0) {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Creating linked server for [$SqlInstanceAsDataDestination] on [$SqlInstanceToBaseline].."
        Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database master -Query $sqlLinkedServerForDataDestinationInstance -EnableException
    } else {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Linked server named [$SqlInstanceAsDataDestination] already exists on [$SqlInstanceToBaseline]." | Write-Host -ForegroundColor Red
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'ERROR:', "Kindly validate if linked server is able to access data of [$SqlInstanceAsDataDestination].[$DbaDatabase] database." | Write-Host -ForegroundColor Red
        "STOP and check above error message" | Write-Error
    }
}


# 36__AlterViewsForDataDestinationInstance
$stepName = '36__AlterViewsForDataDestinationInstance'
if( ($stepName -in $Steps2Execute) -and ($SqlInstanceToBaseline -ne $SqlInstanceAsDataDestination) )
{
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Working on step '$stepName'.."

    # Alter dbo.vw_performance_counters
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Alter view [dbo].[vw_performance_counters].."
    $sqlAlterViewPerformanceCounters = @"
alter view dbo.vw_performance_counters
as
with cte_counters_local as (select collection_time_utc, host_name, object, counter, value, instance from dbo.performance_counters)
,cte_counters_datasource as (select collection_time_utc, host_name, object, counter, value, instance from [$SqlInstanceAsDataDestinationWithOutPort].[$DbaDatabase].dbo.performance_counters)

select collection_time_utc, host_name, object, counter, value, instance from cte_counters_local
union all
select collection_time_utc, host_name, object, counter, value, instance from cte_counters_datasource
"@
    Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -Query $sqlAlterViewPerformanceCounters -EnableException


    # Alter dbo.vw_os_task_list
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Alter view [dbo].[vw_os_task_list].."
    $sqlAlterViewOsTaskList = @"
alter view dbo.vw_os_task_list
as
with cte_os_tasks_local as (select [collection_time_utc], [host_name], [task_name], [pid], [session_name], [memory_kb], [status], [user_name], [cpu_time], [cpu_time_seconds], [window_title] from dbo.os_task_list)
,cte_os_tasks_datasource as (select [collection_time_utc], [host_name], [task_name], [pid], [session_name], [memory_kb], [status], [user_name], [cpu_time], [cpu_time_seconds], [window_title] from [$SqlInstanceAsDataDestinationWithOutPort].[$DbaDatabase].dbo.os_task_list)

select [collection_time_utc], [host_name], [task_name], [pid], [session_name], [memory_kb], [status], [user_name], [cpu_time], [cpu_time_seconds], [window_title] from cte_os_tasks_local
union all
select [collection_time_utc], [host_name], [task_name], [pid], [session_name], [memory_kb], [status], [user_name], [cpu_time], [cpu_time_seconds], [window_title] from cte_os_tasks_datasource;
"@
    Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -Query $sqlAlterViewOsTaskList -EnableException


    # Alter dbo.vw_disk_space
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Alter view [dbo].[vw_disk_space].."
    $sqlAlterViewDiskSpace = @"
alter view dbo.vw_disk_space
as
with cte_disk_space_local as (select collection_time_utc, host_name, disk_volume, label, capacity_mb, free_mb, block_size, filesystem from dbo.disk_space)
,cte_disk_space_datasource as (select collection_time_utc, host_name, disk_volume, label, capacity_mb, free_mb, block_size, filesystem from [$SqlInstanceAsDataDestinationWithOutPort].[$DbaDatabase].dbo.disk_space)

select collection_time_utc, host_name, disk_volume, label, capacity_mb, free_mb, block_size, filesystem from cte_disk_space_local
union all
select collection_time_utc, host_name, disk_volume, label, capacity_mb, free_mb, block_size, filesystem from cte_disk_space_datasource
go
"@
    Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -Query $sqlAlterViewDiskSpace -EnableException
}


# Execute PostQuery
if(-not [String]::IsNullOrEmpty($PostQuery)) {
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "*****Executing PostQuery on [$SqlInstanceToBaseline].." | Write-Host -ForegroundColor Cyan
    Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -Query $PostQuery -EnableException
}


# Update Version No
if( $true )
{
    "`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Update SQLMonitor Version Number.."

    $sqlUpdateSQLMonitorVersion = @"
update dbo.instance_details 
set [sqlmonitor_version] = '$sqlmonitorVersion'
where sql_instance = '$SqlInstanceToBaselineWithOutPort'
and host_name = '$HostName'
"@

    $sqlUpdateInventoryVersionEntry = @"
update dbo.instance_details 
set [sqlmonitor_version] = '$sqlmonitorVersion', [is_enabled] = 1
where sql_instance = '$SqlInstanceToBaselineWithOutPort'
and host_name = '$HostName'
"@

    # Update dbo.instance_details on SqlInstanceToBaseline
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Update SQLMonitor version on [$SqlInstanceToBaseline].."
    Invoke-DbaQuery -SqlInstance $conSqlInstanceToBaseline -Database $DbaDatabase -Query $sqlUpdateSQLMonitorVersion -EnableException

    # Update dbo.instance_details on SqlInstanceAsDataDestination
    if($SqlInstanceAsDataDestination -ne $SqlInstanceToBaseline) {
        "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Update SQLMonitor version on [$SqlInstanceAsDataDestination].."
        Invoke-DbaQuery -SqlInstance $conSqlInstanceAsDataDestination -Database $DbaDatabase -Query $sqlUpdateSQLMonitorVersion -EnableException
    }

    # Update dbo.instance_details on InventoryServer
    "$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Update SQLMonitor version on [$InventoryServer].."
    Invoke-DbaQuery -SqlInstance $conInventoryServer -Database $InventoryDatabase -Query $sqlUpdateInventoryVersionEntry -EnableException
}


"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Clearing old PSSessions.."
Get-PSSession | Remove-PSSession

"`n$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Baselining of [$SqlInstanceToBaseline] completed."

$timeTaken = New-TimeSpan -Start $startTime -End $(Get-Date)
"$(Get-Date -Format yyyyMMMdd_HHmm) {0,-10} {1}" -f 'INFO:', "Execution completed in $($timeTaken.TotalSeconds) seconds."



<#
    .SYNOPSIS
    Baselines the SQL Server instance by creating all required objects, Perfmon data collector, and required SQL Agent jobs. Adds linked server on inventory instance.
    .DESCRIPTION
    This function accepts various parameters and perform baselining of the SQLInstance with creation of required tables, views, procedures, jobs, perfmon data collector, and linked server.
    .PARAMETER SqlInstanceToBaseline
    Name/IP of SQL Instance that has to be baselined. Instances should be capable of connecting from remove machine SSMS using this name/ip.
    .PARAMETER DbaDatabase
    Name of DBA database on the SQL Instance being baseline, and as well target on [SqlInstanceAsDataDestination].
    .PARAMETER SqlInstanceAsDataDestination
    Name/IP of SQL Instance that would store the data caputured using Perfmon data collection. Generally same as [SqlInstanceToBaseline]. But, this could be different from [SqlInstanceToBaseline] in central repository scenario.
    .PARAMETER SqlInstanceForTsqlJobs
    Name/IP of SQL Instance that could be used to host SQL Agent jobs that call tsql scripts. Generally same as [SqlInstanceToBaseline]. This can be used in case of Express Edition as agent services are not available.
    .PARAMETER SqlInstanceForPowershellJobs
    Name/IP of SQL Instance that could be used to host SQL Agent jobs that call tsql scripts. Generally same as [SqlInstanceToBaseline]. This can be used when [SqlInstanceToBaseline] is Express Edition, or not capable of running PowerShell Jobs successfully due to being old version of powershell, or incapability of install modules like dbatools.
    .PARAMETER InventoryServer
    Name/IP of SQL Instance that would act as inventory server and is the data source on Grafana application. A linked server would be created for [SqlInstanceToBaseline] on this server.
    .PARAMETER InventoryDatabase
    Name of DBA database on the InventoryServer. Default to be same as DbaDatabase.
    .PARAMETER HostName
    Name of server where Perfmon data collection & other OS level settings would be done. For standalone SQL Instances, this is not required as this value can be retrieved from tsql. But for active/passive SQLCluster setup where SQL Cluster instance may have other passive nodes, this value can be explictly passed to setup perfmon collection of other passive hosts.
    .PARAMETER IsNonPartitioned
    Switch to signify if Partitioning of table should NOT be done even if supported.
    .PARAMETER SQLMonitorPath
    Path of SQLMonitor tool parent folder. This is the folder that contains other folders/files like Alerting, Credential-Manager, DDLs, SQLMonitor, Inventory etc.
    .PARAMETER DbaToolsFolderPath
    Local directory path of dbatools powershell module that was downloaded locally from github https://github.com/dataplat/dbatools.
    .PARAMETER FirstResponderKitZipFile
    Specifies the path to a local file to install FRK from. This should be the zip file as distributed by the maintainers. If this parameter is not specified, the latest version will be downloaded and installed from https://github.com/BrentOzarULTD/SQL-Server-First-Responder-Kit
    .PARAMETER DarlingDataZipFile
    Specifies the path to a local file to install from. This should be the zip file as distributed by the maintainers. If this parameter is not specified, the latest version will be downloaded and installed from https://github.com/erikdarlingdata/DarlingData
    .PARAMETER RemoteSQLMonitorPath
    Desired SQLMonitor folder location on [SqlInstanceToBaseline] or [SqlInstanceForDataCollectionJobs]. At this path, folder SQLMonitor\SQLMonitor would be copied. On target instance, all the SQL Agent jobs would call the scripts from this folder.
    .PARAMETER MailProfileFileName
    Script file containing tsql that helps in creating mail profile using GMail. This is NOT executed, but displayed when no default global mail profile is found.
    .PARAMETER WhoIsActiveFileName
    Script file containg tsql that compiles [sp_WhoIsActive] in master database. This is modified version of sp_WhoIsActive that returns JobName instead of JobID in [program_name] column.
    .PARAMETER AllDatabaseObjectsFileName
    Script file containing tsql that creates/populates all required objects like partition function, partition scheme, tables and views in [DbaDatabase].
    .PARAMETER XEventSessionFileName
    Script file containing tsql that creates XEvent session [resource_consumption]. By default, the XEvent target files are placed in a new folder named [xevents] inside parent folder of [DbaDatabase] database files.
    .PARAMETER WhatIsRunningFileName
    Script file containing tsql that compiles [sp_WhatIsRunning] in [DbaDatabase].
    .PARAMETER UspGetAllServerInfoFileName
    Script file containing tsql that compiles [usp_GetAllServerInfo] in [DbaDatabase] on [InventoryServer]. This stored procedure provides basic health metrics for all/specific servers.
    .PARAMETER UspCollectWaitStatsFileName
    Script file containing tsql that compiles [usp_collect_wait_stats] in [DbaDatabase] on [SqlInstanceToBaseline].
    .PARAMETER UspCollectMemoryClerksFileName
    Script file containing tsql that compiles [usp_collect_memory_clerks] in [DbaDatabase] on [SqlInstanceToBaseline].
    .PARAMETER UspCollectFileIOStatsFileName
    Script file containing tsql that compiles [usp_collect_file_io_stats] in [DbaDatabase] on [SqlInstanceToBaseline].
    .PARAMETER UspCollectXeventsResourceConsumptionFileName
    Script file containing tsql that compiles [usp_collect_xevents_resource_consumption] in [DbaDatabase] on [SqlInstanceToBaseline].
    .PARAMETER UspPartitionMaintenanceFileName 
    Script file containing tsql that compiles [usp_partition_maintenance] in [DbaDatabase] on [SqlInstanceToBaseline].
    .PARAMETER UspPurgeTablesFileName
    Script file containing tsql that compiles [usp_purge_tables] in [DbaDatabase] on [SqlInstanceToBaseline].
    .PARAMETER UspRunWhoIsActiveFileName
    Script file containing tsql that compiles [usp_run_WhoIsActive] in [DbaDatabase] on [SqlInstanceToBaseline].
    .PARAMETER UspActiveRequestsCountFileName
    Script file containing tsql that compiles [usp_active_requests_count] in [DbaDatabase] on [SqlInstanceToBaseline].
    .PARAMETER UspWaitsPerCorePerMinuteFileName
    Script file containing tsql that compiles [usp_waits_per_core_per_minute] in [DbaDatabase] on [SqlInstanceToBaseline].
    .PARAMETER UspEnablePageCompressionFileName
    Script file containing tsql that compiles [usp_enable_page_compression] in [DbaDatabase] on [SqlInstanceToBaseline].
    .PARAMETER WhoIsActivePartitionFileName
    Script file containing tsql that convert dbo.WhoIsActive table into partitioned tables if supported.
    .PARAMETER BlitzIndexPartitionFileName
    Script file containing tsql that convert dbo.BlitzIndex table into partitioned tables if supported.
    .PARAMETER GrafanaLoginFileName
    Script file containing tsql that creates [grafana] login/user on [master] & [DbaDatabase] on [SqlInstanceToBaseline].
    .PARAMETER CheckInstanceAvailabilityFileName
    Script file containing tsql that creates sql agent job [(dba) Check-InstanceAvailability] on Inventory Server which calls powershell script to check if a particular SQL Instance is online or not.
    .PARAMETER CollectDiskSpaceFileName
    Script file containing tsql that creates sql agent job [(dba) Collect-DiskSpace] on server [SqlInstanceForPowerShellJobs] which calls powershell scripts for collecting Disk Space utilization from server [SqlInstanceToBaseline].
    .PARAMETER CollectOSProcessesFileName
    Script file containing tsql that creates sql agent job [(dba) Collect-OSProcesses] on server [SqlInstanceForPowerShellJobs] which calls powershell scripts for collecting OS Processes from server [SqlInstanceToBaseline].
    .PARAMETER CollectPerfmonDataFileName
    Script file containing tsql that creates sql agent job [(dba) Collect-PerfmonData] on server [SqlInstanceForPowerShellJobs] which calls powershell scripts for collecting collecting Perfmon data from server [SqlInstanceToBaseline].
    .PARAMETER CollectWaitStatsFileName
    Script file containing tsql that creates sql agent job [(dba) Collect-WaitStats] on server [SqlInstanceForTsqlJobs] which captures cumulative waits.
    .PARAMETER CollectMemoryClerksFileName
    Script file containing tsql that creates sql agent job [(dba) Collect-MemoryClerks] on server [SqlInstanceForTsqlJobs] which captures realtime memory consumption.
    .PARAMETER CollectXEventsJobFileName
    Script file containing tsql that creates sql agent job [(dba) Collect-XEvents] on server [SqlInstanceForTsqlJobs] which reads data from XEvent session [resource_consumption] & pushes it to SQL tables.
    .PARAMETER PartitionsMaintenanceFileName
    Script file containing tsql that creates sql agent job [(dba) Partitions-Maintenance] on server [SqlInstanceForTsqlJobs]. This job adds further partions and purges old partitions from partitioned tables.
    .PARAMETER PurgeTablesFileName
    Script file containing tsql that creates sql agent job [(dba) Purge-Tables] on server [SqlInstanceForTsqlJobs]. This job helps in purging old data from tables. Retention threshold varies table to table.
    .PARAMETER RemoveXEventFilesFileName
    Script file containing tsql that creates sql agent job [(dba) Remove-XEventFiles] on server [SqlInstanceForPowerShellJobs]. This job helps in purging Old XEvent files which are already processed.
    .PARAMETER RunWhoIsActiveFileName
    Script file containing tsql that creates sql agent job [(dba) Run-WhoIsActive] on server [SqlInstanceForTsqlJobs]. This job captures snapshot of server sessions using sp_WhoIsActive.
    .PARAMETER UpdateSqlServerVersionsFileName
    Script file containing tsql that creates sql agent job [(dba) Update-SqlServerVersions] on [InventoryServer] server. This job updates the latest version/service pack details into table master.dbo.SqlServerVersions.
    .PARAMETER LinkedServerOnInventoryFileName
    Script file containing tsql that creates linked server for [SqlInstanceToBaseline] on [InventoryServer] server using [grafana] login.
    .PARAMETER TestWindowsAdminAccessFileName
    Script file containing tsql that creates temporary sql agent job [(dba) Test-WindowsAdminAccess] on server [SqlInstanceToBaseline]. This job helps in finding if sql agent proxy is required for executing powershell script.
    .PARAMETER DbaGroupMailId
    List of DBA/group email ids that should receive job failure alerts.
    .PARAMETER StartAtStep
    Starts the baselining automation on this step. If no value provided, then baselining starts with 1st step.
    .PARAMETER SkipSteps
    List of steps that should be skipped in the baselining automation.
    .PARAMETER OnlySteps
    List of steps that should be the only steps to be executed. This parameter has highest precedence and overrides other settings.
    .PARAMETER StopAtStep
    End the baselining automation on this step. If no value provided, then baselining finishes with last step.
    .PARAMETER SqlCredential
    PowerShell credential object to execute queries any SQL Servers. If no value provided, then connectivity is tried using Windows Integrated Authentication.
    .PARAMETER WindowsCredential
    PowerShell credential object that could be used to perform OS interactives tasks. If no value provided, then connectivity is tried using Windows Integrated Authentication. This is important when [SqlInstanceToBaseline] is not in same domain as current host.
    .PARAMETER RetentionDays 
    No of days as data retention threshold in tables  of SQLMonitor. Data older than this value would be purged daily once.
    .PARAMETER DropCreatePowerShellJobs
    When enabled, drops the existing SQL Agent jobs having CmdExec steps, and creates them from scratch. By default, Jobs running CmdExec step are not dropped if found existing.
    .PARAMETER DropCreateWhoIsActiveTable
    When enabled, drops the existing WhoIsActive table, and creates it from scratch. This might be required in case of change in sp_WhoIsActive features usage.
    .PARAMETER SkipPowerShellJobs
    When enabled, baselining steps involving create of SQL Agent jobs having CmdExec steps are skipped.
    .PARAMETER SkipMultiServerviewsUpgrade
    Default enabled. This skips alter of views like vw_performance_counters, vw_disk_space, vw_os_tasks_list etc which interact with multiple hosts in many cases.
    .PARAMETER SkipTsqlJobs
    When enabled, skips creation of all the SQL Agent jobs that execute tsql stored procedures.
    .PARAMETER SkipRDPSessionSteps
    When enabled, any steps that need OS level interaction is skipped. This includes copy of dbatools powershell module, SQLMonitor folder on remove path, creation of Perfmon Data Collector etc.
    .PARAMETER SkipWindowsAdminAccessTest
    When enabled, script does not check if Proxy/Credential is required for running PowerShell jobs.
    .PARAMETER SkipMailProfileCheck 
    When enabled, script does not look for default global mail profile.
    .PARAMETER SkipCollationCheck 
    When enabled, database collations checks are skipped. This means we don't validate if the collation of DBA database  is same as system databases or not.
    .PARAMETER SkipPageCompression
    When enabled, page data compression of SQLMonitor tables is skipped.
    .PARAMETER ConfirmValidationOfMultiInstance
    If required for confirmation from end user in case multiple SQL Instances are found on same host. At max, perfmon data can be pushed to only one SQL Instance.
    .PARAMETER ConfirmSetupOfTaskSchedulerJobs
    If SQLInstance is SQL Express edition, then this parameter ensures that local SQLInstance level jobs are created in Windows Task Scheduler.
    .PARAMETER DryRun
    When enabled, only messages are printed, but actual changes are NOT made.
    .PARAMETER PreQuery
    TSQL String that should be executed before actual SQLMonitor scripts are run. This is useful when specific pre-changes are required for SQLMonitor. For example, drop/create few columns etc.
    .PARAMETER PostQuery
    TSQL String that should be executed after actual SQLMonitor scripts are run. This is useful when specific post-changes are required due to environment specific needs.
    .EXAMPLE
$params = @{
    SqlInstanceToBaseline = 'Workstation'
    DbaDatabase = 'DBA'
    DbaToolsFolderPath = 'F:\GitHub\dbatools'
    RemoteSQLMonitorPath = 'C:\SQLMonitor'
    InventoryServer = 'SQLMonitor'
    DbaGroupMailId = 'sqlagentservice@gmail.com'
    #SqlCredential = $saAdmin
    #WindowsCredential = $LabCredential
    #SkipSteps = @("11__SetupPerfmonDataCollector", "12__CreateJobCollectOSProcesses","13__CreateJobCollectPerfmonData")
    #StartAtStep = '33__GrafanaLogin'
    #StopAtStep = '21__WhoIsActivePartition'
    #DropCreatePowerShellJobs = $true
    #DryRun = $false
    #SkipRDPSessionSteps = $true
    #SkipPowerShellJobs = $true
    #SkipAllJobs = $true
}
F:\GitHub\SQLMonitor\SQLMonitor\Install-SQLMonitor.ps1 @Params

Baseline SQLInstance [Workstation] using [DBA] database. Use [SQLMonitor] as Inventory SQLInstance, and alerts should go to 'sqlagentservice@gmail.com'.
    .EXAMPLE
$LabCredential = Get-Credential -UserName 'Lab\SQLServices' -Message 'AD Account'
$saAdmin = Get-Credential -UserName 'sa' -Message 'sa'
#$localAdmin = Get-Credential -UserName 'Administrator' -Message 'Local Admin'

cls
$params = @{
    SqlInstanceToBaseline = 'Workstation'
    DbaDatabase = 'DBA'
    DbaToolsFolderPath = 'F:\GitHub\dbatools'
    RemoteSQLMonitorPath = 'C:\SQLMonitor'
    InventoryServer = 'SQLMonitor'
    DbaGroupMailId = 'sqlagentservice@gmail.com'
    SqlCredential = $saAdmin
    WindowsCredential = $LabCredential
    #SkipSteps = @("11__SetupPerfmonDataCollector", "12__CreateJobCollectOSProcesses","13__CreateJobCollectPerfmonData")
    #StartAtStep = '33__GrafanaLogin'
    #StopAtStep = '21__WhoIsActivePartition'
    #DropCreatePowerShellJobs = $true
    #DryRun = $false
    #SkipRDPSessionSteps = $true
    #SkipPowerShellJobs = $true
    #SkipAllJobs = $true
}
F:\GitHub\SQLMonitor\SQLMonitor\Install-SQLMonitor.ps1 @Params

Baseline SQLInstance [Workstation] using [DBA] database. Use [SQLMonitor] as Inventory SQLInstance. Alerts are sent to 'sqlagentservice@gmail.com'. Using $saAdmin credential while interacting with SQLInstance. Similary, for performing OS interactive task, use $LabCredential.
    .NOTES
Owner Ajay Kumar Dwivedi (ajay.dwivedi2007@gmail.com)
    .LINK
    https://ajaydwivedi.com/github/sqlmonitor
    https://ajaydwivedi.com/youtube/sqlmonitor
    https://ajaydwivedi.com/blog/sqlmonitor    
#>


