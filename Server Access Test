#ESX Test by Hostname
cls


function Function-ILOHostname {
    param (
        [string]$ILOIP,
        [string]$username,
        [string]$password
          )
   
    if (ping $ILOIP) {
              $connection = Connect-HPEiLO -Address $ILOIP -Username $username -Password $password -DisableCertificateAuthentication
              $ILOHost = Get-HPEiLOSystemInfo -Connection $connection
              $ESXHostname = $ILOHost.DNSHostName
              Disconnect-HPEiLO -Connection $connection 
              return $ESXHostname
              }

    else {
           $FailedILO=$ILOIP
           return $FailedILO     
         }
     }


$ESXlist = Import-Csv -Path "C:\Users\fb009312\Desktop\ESXIP.csv"
$ILOlist = Import-Csv -Path "C:\Users\fb009312\Desktop\ILOIP.csv"
$username = "USERID"
$password = "FibaAdmin2022"

$FailedIPs = "C:\Users\fb009312\Desktop\FailedIP.txt"
date > "$FailedIPs"



function Function-ESXCheck {
    param (
        [string]$ESXIP,
        [string]$ESXHostname
          )

    if (Test-Connection -Count 1 -ComputerName $ESXIP -Quiet) {
        Write-Host "Successful Connection  ESXI for $ESXIP" -ForegroundColor Green
          } 
             
    else  { 
        Write-Host "Failed ESXI Access for $ESXIP" -ForegroundColor Red
        $FailedIP = "ESXI Cable-Access Fail: $ESXIP, ESXI Host: $ESXHostname"
        $FailedIP | Out-File -Append -FilePath $FailedIPs
          }
    }



    $counter=0
  
    foreach ($ILOHosts in $ILOlist) {
    $ILOIP=$ILOHosts.IP
    $ESXHostname=Function-ILOHostname -ILOIP $ILOIP -username $username -password $password
   
    $ESXIP = $ESXlist[$counter].IP       
    Function-ESXCheck -ESXIP $ESXIP -ESXHostname $ESXHostname 
    Write-Host "ESXI IP : $ESXIP" -ForegroundColor Yellow
     
        if($FailedILO) {
    Write-Host "Failed ILO Access for $FailedILO" -ForegroundColor DarkRed
        }

        else {
    Write-Host "ILO IP: $ILOIP" -ForegroundColor Cyan

        }

    Write-Host "Process : $counter" -ForegroundColor Magenta
    $counter++
    }


        
 

