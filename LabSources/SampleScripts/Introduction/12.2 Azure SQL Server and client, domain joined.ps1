# Same as '06 SQL Server and client, domain joined.ps1' but targeting Azure.
#
#This intro script is extending '03 Single domain-joined server.ps1'. An additional ISO is added to the lab which is required to install SQL Server 2014. The script makes
#use of the $PSDefaultParameterValues feature introduced in PowerShell version 4. Settings that are the same for all machines can be summarized
#that way and still be overwritten when necessary.

$azureDefaultLocation = 'West Europe' #COMMENT OUT -DefaultLocationName BELOW TO USE THE FASTEST LOCATION

New-LabDefinition -Name 'cLab1' -DefaultVirtualizationEngine HyperV

Add-LabAzureSubscription -DefaultLocationName $azureDefaultLocation

#defining default parameter values, as these ones are the same for all the machines
$PSDefaultParameterValues = @{
    'Add-LabMachineDefinition:DomainName' = 'contoso.com'
    'Add-LabMachineDefinition:Memory' = 1GB
    'Add-LabMachineDefinition:OperatingSystem' = 'Windows Server 2012 R2 Datacenter (Server with a GUI)'
}

Add-LabMachineDefinition -Name cDC1 -Roles RootDC

Add-LabMachineDefinition -Name cSQL1 -Roles SQLServer2014

Install-Lab

Show-LabDeploymentSummary -Detailed