a#Server SN Check
#Getting the Commands

Import-Module HPEiLOCmdlets
Get-Command -Module HPEiLOCmdlets


$username = "USERID"
$password = "FibaAdmin2022"
$list=Import-Csv -Path C:\Users\fb009312\Desktop\Hosts_24_04.csv
$servers = $list | Where-Object { ($_.Vendor -eq "HPE") -and ($_.PSObject.Properties.Value -ne '') } | Select-Object -ExpandProperty AddressIPMI


#Servers Serials from Daily csv Report

Function CSV_Serial {

$servers = $list | Where-Object { ($_.Vendor -eq "HPE") -and ($_.PSObject.Properties.Value -ne '') } | Select-Object -ExpandProperty Serial
Write-Host "CSV HPE Hosts Serial Numbers Adding to CSV_Serial.txt" -ForegroundColor Green
Add-Content "C:\Users\fb009312\Desktop\CSV_Serial.txt" $servers

}

CSV_Serial




Function ILO_Serial {
foreach ($row in $servers) {


  
	$connection = Connect-HPEiLO -Address $row -Username $username -Password $password -DisableCertificateAuthentication
	$Chassis=Get-HPEiLOChassisInfo -Connection $connection
     Add-Content "C:\Users\fb009312\Desktop\ILO_Serial.txt" $Chassis.SerialNumber
    
         }
    }


ILO_Serial


Write-Host "ILO Hosts Serial Number Added to ILO_Serial" -ForegroundColor Yellow

#Compare the both serials

Compare-Object -ReferenceObject (Get-Content -Path C:\Users\fb009312\Desktop\CSV_Serial.txt) -DifferenceObject (Get-Content -Path C:\Users\fb009312\Desktop\ILO_Serial.txt)



  