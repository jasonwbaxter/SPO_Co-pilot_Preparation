# Connect to SharePoint Online
Connect-SPOService -Url https://<tenant>-admin.sharepoint.com

# Specify the group's ID
$groupId = "spo-grid-all-users/eed97d6b-5444-44cd-9eae-85380aa53722"
$InputFilePath = "C:\temp\output.csv"
$sites= import-csv -literalpath $InputFilePath

Foreach ($site in $sites ){

    Remove-SPOUser -Site $site.Url -LoginName $groupId 

}