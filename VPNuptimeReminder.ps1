Add-Type -AssemblyName System.Windows.Forms
function KillItOrNot
{
 $shutdown = [System.Windows.Forms.MessageBox]::Show("M�chten Sie die VM wirklich Heunterfahren?","VM Onlinezeit erreicht",4,[System.Windows.Forms.MessageBoxIcon]::Exclamation)
                    if ($shutdown -eq "Yes")
                        {
                        Stop-Computer
                        }

                    elseif ($shutdown -eq "No")
                        {
                        WaitForIt
                        }
                    else
                        {
                        WaitForIt
                        }
}

function WaitForIt
{
Start-Sleep -s 600
main
}


function main {
$os=Get-WmiObject win32_operatingsystem
$uptime = ((get-date) - ($os.ConvertToDateTime($os.lastbootuptime))).Days

if ($uptime -ge 5)
    {
    $Result = [System.Windows.Forms.MessageBox]::Show("Achtung!$([System.Environment]::NewLine)Die VM ist seit $uptime Tagen online.$([System.Environment]::NewLine)" +
        "Aus Sicherheitsg�nden muss die VM nach der Benutzung unverz�glich Heruntergefahren werden.$([System.Environment]::NewLine)" +
        "M�chten Sie die VM Heunterfahren?","VM Onlinezeit erreicht",4,[System.Windows.Forms.MessageBoxIcon]::Exclamation)
 
           If($Result -eq "Yes")
           {
               KillItOrNot
           }
           
           elseif ( $Result -eq "No")
           {
              WaitForIt
           }

           else #bei Abbrechen
           {
             WaitForIt
           }
    }
}


main
