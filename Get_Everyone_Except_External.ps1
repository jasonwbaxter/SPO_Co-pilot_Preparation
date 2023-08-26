# Connect to SharePoint Online
Connect-SPOService -Url https://<tenant>-admin.sharepoint.com

# Specify the group's ID
$groupId = "spo-grid-all-users/eed97d6b-5444-44cd-9eae-85380aa53722"
$outputFilePath = "C:\temp\output.csv"
$sites= import-csv -literalpath c:\temp\groupconnectedsites.csv
$collection=@()

Foreach ($site in $sites ){
# Set Admin as Sitecollection Admin
#Set-SPOUser -Site $site.Url -LoginName <adminuser> -IsSiteCollectionAdmin $true | Out-Null

# Get information about the group 
$group = Get-SPOSiteGroup $site.url 

foreach($g in $group){
    
    if ($g.Users -contains $groupId) { 
        Write-Host "found everyone except external" + $_($g.Title) + $site.Url
        $content =  $($g.Title) +","+ $site.Url
        $content| Out-File -Append -FilePath $outputFilePath -Encoding utf8

             }
    
}
#Remove admin as sitecollection admin.
#Set-SPOUser -Site $site.Url -LoginName <adminuser> -IsSiteCollectionAdmin $false | Out-Null
} 

# Disconnect from SharePoint Online
Disconnect-SPOService
