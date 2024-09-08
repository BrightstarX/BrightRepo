#Cyberark API

#Halil İbrahim Karabacak - CyberArk Edit

#Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Ssl3, [Net.SecurityProtocolType]::Tls, [Net.SecurityProtocolType]::Tls11, [Net.SecurityProtocolType]::Tls12 
#[System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $true }

clear

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"

$headers.Add("Content-Type", "application/json")

$headers.Add("Cookie", "mobileState=Desktop; CA55555=cyberark; CA11111=00000002931561DEA8F42BC4729E4FAD939B23E0DBF0EE967CCC858E7041DEEF70A90A8B00000000; CA22222=DFBB9FA80E7CBB8E30CA844CDCB1FC90E088E7B5FF235B319A62BB2837FEA828")
 
$body = "{`"username`":`"elkuser`",

`n`"password`":`"FibaELK25!!`"

`n

`n

`n}"
 

$response = Invoke-RestMethod 'https://cyberarkweb.fibabanka.local/PasswordVault/API/auth/Cyberark/Logon/' -Method Post -Headers $headers -Body $body 

$response | ConvertTo-Json
 
$token = $response

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"

$headers.Add("Content-Type", "application/json")

$headers.Add("Cookie", "mobileState=Desktop; CA55555=cyberark; CA11111=00000002A07899BB1357E0BD787FC4500FE84E796257A5C179D258A1F5F92154927B896800000000; CA22222=3FCF7480C382E9814F8643AB04BA36D3C67943152B041D52F82121919C903DDD")
 
$headers.Add("Authorization", "$token")



$file=Import-Csv -Path "C:\Users\fb009312\Desktop\Safes.csv"

$safes=$file.Safes

$count=0


foreach ($safe in $safes) {

    $NewSafe= $safe -replace "^Fibabanka_", "P_" 

    $jsondata = @{

    "safeName" = "$NewSafe"

    #"description" = ""
    #"location" = ""
    #"creator" = @{
        #"id" = "692"
        #"name" = "FB007926"}

    "olacEnabled" = $false
    "managingCPM" = "PasswordManager"
    "numberOfVersionsRetention" = 5
    "numberOfDaysRetention" = $null
    
          }

$jsonbody = $jsondata | ConvertTo-Json 

$result = Invoke-RestMethod -Uri "https://cyberarkweb.fibabanka.local/PasswordVault/API/Safes/$safe" -Method Put -Body $jsonbody -Headers $headers 

$count++

$result

Write-Host $count -ForegroundColor Cyan
  


 }



#AccountInfo

{
    "safeUrlId": "Fibabanka_FB009312",
    "safeName": "Fibabanka_FB009312",
    "safeNumber": 642,
    "description": "",
    "location": "\\",
    "creator": {
        "id": "489",
        "name": "FB007926"
    },
    "olacEnabled": false,
    "managingCPM": "PasswordManager",
    "numberOfVersionsRetention": 5,
    "numberOfDaysRetention": null,
    "autoPurgeEnabled": false,
    "creationTime": 1695973225,
    "lastModificationTime": 1702159221949710,
    "accounts": [],
    "isExpiredMember": false
}



#RequestedBody

{
    "safeName":"P_FB009312",
    "safeNumber":642,
    "description":"",
    "location":"\\",
    "creator":{
        "id":"489",
        "name":"FB007926"
    },
    "olacEnabled":false,
    "managingCPM":"PasswordManager",
    "numberOfVersionsRetention":null,
    "numberOfDaysRetention":null
}


