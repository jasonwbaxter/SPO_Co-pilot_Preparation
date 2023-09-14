# Connect to SharePoint Online
Connect-SPOService -Url https://<tenant>-admin.sharepoint.com

# Specify the group's ID
$groupId = "c:0-.f|rolemanager|spo-grid-all-users/<tenantID>"
$InputFilePath = "C:\temp\output.csv"
$sites= import-csv -literalpath $InputFilePath

Foreach ($site in $sites ){

    Remove-SPOUser -Site $site.Url -LoginName $groupId 

}