##################################################
# nicht benötigte Dienste und Tasks deaktivieren #
# Quelle: https://blogs.technet.microsoft.com/secguide/2017/05/29/guidance-on-disabling-system-services-on-windows-server-2016-with-desktop-experience/
##################################################

$Serverices = Get-Content C:\temp\services-to-disable.txt

$abruf = Get-Service $Serverices

foreach ($service in $abruf){
    Stop-Service -InputObject $service -Force
    Set-Service -inputObject $Service -StartupType Disabled
    }

Get-ScheduledTask -Taskpath "\Microsoft\XblGameSave\" | Disable-ScheduledTask