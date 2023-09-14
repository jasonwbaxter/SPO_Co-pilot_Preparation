#Connect to the Tenant
Connect-SPOService -Url https://<tenant>-admin.sharepoint.com

#Get-spotenant

#Hide  All Users people picker for OneDrive
Set-SPOTenant  -ShowAllUsersClaim $false
#Hide Everyone & Everyone Except External from people picker for SPO
Set-SPOTenant  -ShowEveryoneExceptExternalUsersClaim $false
Set-SPOTenant  -ShowEveryoneClaim $false
Set-SPOTenant -AllowEveryoneExceptExternalUsersClaimInPrivateSite $false

#Impact ???
#Roll back is easy
#Scenarios this affects??





#Ignore - Just Brain storming.
#DisallowInfectedFileDownload
#EnableSensitivityLabelforPDF
#IsWBFluidEnabled
#LegacyAuthProtocolsEnabled :$false