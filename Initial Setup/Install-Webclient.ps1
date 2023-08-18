Install-Module -Name PowerShellGet -Force
# Powershell Konsole bei allererster Verwendung unbedingt neu starten!

Install-Module -Name RDWebClientManagement

Install-RDWebClientPackage

Get-RDWebClientPackage

Import-RDWebClientBrokerCert C:\RDBrokerCert.cer

Publish-RDWebClientPackage -Type Production -Latest

# URLs
# Production:
https://RDWebFQDN.server.name/RDWeb/webclient/index.html
# Test
https://RDWebFQDN.server.name/RDWeb/WebClient-Test/index.html