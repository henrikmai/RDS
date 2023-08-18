Install-Module -Name PowerShellGet -Force
# Powershell Konsole bei allererster Verwendung unbedingt neu starten!

Install-Module -Name RDWebClientManagement

Install-RDWebClientPackage

Get-RDWebClientPackage

Import-RDWebClientBrokerCert C:\RDBrokerCert.cer

Publish-RDWebClientPackage -Type Production -Latest