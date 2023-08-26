Connect-SPOService -url https://900904-admin.sharepoint.com 

$outputFilePath = "C:\temp\output.csv"
$group= import-csv -literalpath c:\temp\groupconnectedsites.csv
$collection=@()
Foreach ($site in $group ){

    #Granting Site Collection Admin
    Set-SPOUser -Site $site.Url -LoginName jabaxt@900904.onmicrosoft.com -IsSiteCollectionAdmin $true
    #Processing 100000
    #Finding sites that are actually locked down.
	$externaluser=Get-SPOSiteGroup $site.url
	if($externaluser.Users.Contains("spo-grid-all-users/eed97d6b-5444-44cd-9eae-85380aa53722")-eq 'True'){
      
		Write-Host "Found a Site with Everyone Except External Users"+ $site.url +"in Group" +$result.Title
		$collection+= "Site: "+$site.url+"`n"
		$collection+= "Group Name: "+ $externaluser.Title+"`n"

			}
     #Removing Site Collection Admin
    Set-SPOUser -Site $site.Url -LoginName jabaxt@900904.onmicrosoft.com -IsSiteCollectionAdmin $false
	Remove-SPOUser -Site $site.Url -LoginName jabaxt@900904.onmicrosoft.com
	write-host "Processed site:" $site.url + 'Total found:' $collection.count
        }

        $ObjArray = $collection | Select-Object @{Expression={$_}}
        $ObjArray  |Export-Csv -Path $outputFilePath -Encoding UTF8 -NoTypeInformation
