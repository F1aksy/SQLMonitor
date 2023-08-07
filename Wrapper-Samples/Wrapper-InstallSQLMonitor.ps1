#$DomainCredential = Get-Credential -UserName 'Lab\SQLServices' -Message 'AD Account'
#$saAdmin = Get-Credential -UserName 'sa' -Message 'sa'
#$localAdmin = Get-Credential -UserName 'Administrator' -Message 'Local Admin'

cls
Import-Module dbatools;
$params = @{
    SqlInstanceToBaseline = 'Workstation'
    DbaDatabase = 'DBA'
    #HostName = 'Workstation'
    #RetentionDays = 7
    DbaToolsFolderPath = 'D:\Github\dbatools' # Download from Releases section
    #FirstResponderKitZipFile = 'D:\Github\SQL-Server-First-Responder-Kit-20230215.zip' # Download from Releases section
    #DarlingDataZipFile = 'D:\Github\DarlingData-main.zip' # Download from Code dropdown    
    #OlaHallengrenSolutionZipFile = 'D:\Github\sql-server-maintenance-solution-master.zip' # Download from Code dropdown
    #RemoteSQLMonitorPath = 'C:\SQLMonitor'
    InventoryServer = 'SQLMonitor'
    InventoryDatabase = 'DBA'
    DbaGroupMailId = 'some_dba_mail_id@gmail.com'
    #SqlCredential = $personal
    #WindowsCredential = $DomainCredential
    <#
    SkipSteps = @( "1__sp_WhoIsActive", "2__AllDatabaseObjects", "3__XEventSession",
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
    #>
    #OnlySteps = @( "34__LinkedServerOnInventory")
    #StartAtStep = '1__sp_WhoIsActive'
    #StopAtStep = '32__AlterViewsForDataDestinationInstance'
    #DropCreatePowerShellJobs = $true
    #DryRun = $false
    #SkipRDPSessionSteps = $true
    #SkipPowerShellJobs = $true
    #SkipTsqlJobs = $true
    #SkipMailProfileCheck = $true
    #skipCollationCheck = $true
    #SkipWindowsAdminAccessTest = $true
    #SkipDriveCheck = $true
    #SkipPingCheck = $true
    #SkipMultiServerviewsUpgrade = $false
    #ForceSetupOfTaskSchedulerJobs = $true
    #SqlInstanceAsDataDestination = 'Workstation'
    #SqlInstanceForPowershellJobs = 'Workstation'
    #SqlInstanceForTsqlJobs = 'Workstation'
    #ConfirmValidationOfMultiInstance = $true
    #ConfirmSetupOfTaskSchedulerJobs = $true
    #HasCustomizedTsqlJobs = $true
    #HasCustomizedPowerShellJobs = $true
    #OverrideCustomizedTsqlJobs = $false
    #OverrideCustomizedPowerShellJobs = $false
}
F:\GitHub\SQLMonitor\SQLMonitor\Install-SQLMonitor.ps1 @Params #-Debug

#Get-Help F:\GitHub\SQLMonitor\SQLMonitor\Install-SQLMonitor.ps1 -ShowWindow

<#
$dropWhoIsActive = @"
if object_id('dbo.WhoIsActive_Staging') is not null
	drop table dbo.WhoIsActive_Staging;

if object_id('dbo.WhoIsActive') is not null
	drop table dbo.WhoIsActive;
"@;
F:\GitHub\SQLMonitor\SQLMonitor\Install-SQLMonitor.ps1 @Params -PreQuery $dropWhoIsActive
#>

<#
Invoke-WebRequest https://github.com/imajaydwivedi/SQLMonitor/archive/refs/heads/dev.zip -OutFile "$env:USERPROFILE\Downloads\sqlmonitor.zip"
Invoke-WebRequest https://github.com/dataplat/dbatools/releases/download/v1.1.142/dbatools-signed.zip -OutFile "$env:USERPROFILE\Downloads\dbatools.zip"
#>

<#
Get-DbaDbMailProfile -SqlInstance '192.168.56.31' -SqlCredential $personalCredential
Copy-DbaDbMail -Source '192.168.56.15' -Destination '192.168.56.31' -SourceSqlCredential $personalCredential -DestinationSqlCredential $personalCredential # Lab
New-DbaCredential -SqlInstance 'xy' -Identity $LabCredential.UserName -SecurePassword $LabCredential.Password -Force # -SqlCredential $SqlCredential -EnableException
New-DbaAgentProxy -SqlInstance 'xy' -Name $LabCredential.UserName -ProxyCredential $LabCredential.UserName -SubSystem PowerShell,CmdExec

Enable-PSRemoting -Force -SkipNetworkProfileCheck # remote machine
Set-Item WSMAN:\Localhost\Client\TrustedHosts -Value SQLMonitor.Lab.com -Concatenate -Force # remote machine
Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name LocalAccountTokenFilterPolicy
Set-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name LocalAccountTokenFilterPolicy -Value 1

# Incase 
#Set-Item WSMAN:\Localhost\Client\TrustedHosts -Value * -Force # run on local machine
#Set-NetConnectionProfile -NetworkCategory Private # Execute this only if above command fails

Enter-PSSession -ComputerName '192.168.56.31' -Credential $localAdmin -Authentication Negotiate
Test-WSMan '192.168.56.31' -Credential $localAdmin -Authentication Negotiate


#>

