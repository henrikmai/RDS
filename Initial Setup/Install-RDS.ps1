$RDSLS= 'RDS-WA1.RDS.lab'  # Lizenz-Server
$RDSCB= "RDS-CB1.RDS.lab"  # Verbindungsbroker
$RDSWA= "RDS-WA1.RDS.lab"  # Web Access
$RDSGW= "RDS-GW1.RDS.lab" # Gateway - Server
$RDSSH= "RDS-SH1.RDS.lab","RDS-SH2.RDS.lab" # Verbindungshosts

##################
# Farm erstellen #
##################
New-RDSessionDeployment -ConnectionBroker $RDSCB -SessionHost $RDSSH -WebAccessServer $RDSWA -Verbose

# Ausgabe der Rollenverteilung
Get-RDServer

###############
# Remote Apps #
###############
# Create Session Collection
New-RDSessionCollection -CollectionName Anwendungen -CollectionDescription "Freigabe von Anwendungen" -SessionHost RDS-SH2.RDS.lab -ConnectionBroker $RDSCB -Verbose

# Publish Apps
# Datev
New-RDRemoteapp -Alias Reisekosten -DisplayName Reisekosten -FilePath "c:\Program Files (x86)\DATEV\PROGRAMM\REKI\DATEV.Reki.Win.exe" -ShowInWebAccess 1 -CollectionName "Anwendungen" -ConnectionBroker rds-gateway.softed.de
# Adobe Acrobat
New-RDRemoteApp -Alias "Adobe Acrobat" -DisplayName "Adobe Actobat" -FilePath "C:\Windows\System32\mstsc.exe" -CommandLineSetting Require -RequiredCommandLine /v:vcitrix114.softed.de -ShowInWebAccess 1 -CollectionName "Anwendungen" -ConnectionBroker rds-gateway.softed.de -IconPath "\\rds-sh5\c$\Windows\16.ico" -Verbose

# Customize Collection Setting
Set-RDSessionCollectionConfiguration -CollectionName Anwendungen -UserGroup "rds\alice" -ConnectionBroker $RDSCB
Set-RDSessionCollectionConfiguration -CollectionName Anwendungen -IdleSessionLimitMin 60 -DisconnectedSessionLimitMin 120
Set-RDSessionCollectionConfiguration -CollectionName Anwendungen -EnableUserProfileDisk -DiskPath \\rds-cb1\UPD\RemoteApps -MaxUserProfileDiskSizeGB 20

####################
# Terminal Desktop #
####################
# Create Session Collection
New-RDSessionCollection -CollectionName Terminalserver -CollectionDescription "Terminalserver" -SessionHost rds-sh1.softed.de -ConnectionBroker $RDSCB -Verbose

# Customize Collection Setting
Set-RDSessionCollectionConfiguration -CollectionName Terminalserver -UserGroup "rds\alice" -ConnectionBroker $RDSCB
Set-RDSessionCollectionConfiguration -CollectionName Terminalserver -IdleSessionLimitMin 180 -DisconnectedSessionLimitMin 480
Set-RDSessionCollectionConfiguration -CollectionName Terminalserver -EnableUserProfileDisk -DiskPath \\rds-cb1\UPD\Desktops -MaxUserProfileDiskSizeGB 20

########################
# Install RDS Lic Role #
########################
Add-RDServer -Server $RDSLS -Role RDS-LICENSING -ConnectionBroker $RDSCB -Verbose

Set-RDLicenseConfiguration -LicenseServer $RDSLS -Mode PerUser -ConnectionBroker $RDSCB -Verbose

################
# Certificates #
################

$mypwd = ConvertTo-SecureString -String "MUSS EINGEFÜGT WERDEN" -Force –AsPlainText
$certpath = "PATH TO .pfx-FILE"
Import-PfxCertificate –FilePath $certpath cert:\localMachine\my -Password $mypwd

# Import Certificates
Set-RDCertificate -Role RDPublishing -ImportPath $certpath -Password $mypwd -ConnectionBroker $RDSCB -Verbose -Force
Set-RDCertificate -Role RDWebAccess -ImportPath $certpath -Password $mypwd -ConnectionBroker $RDSCB -Verbose -Force
Set-RDCertificate -Role RDGateway -ImportPath $certpath -Password $mypwd -ConnectionBroker $RDSCB -Verbose -Force
Set-RDCertificate -Role RDRedirector -ImportPath $certpath -Password $mypwd -ConnectionBroker $RDSCB -Verbose -Force