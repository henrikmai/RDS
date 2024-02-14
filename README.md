# RDS
#### Usefull Links
###### Remote Desktop Services - High availability
https://docs.microsoft.com/en-us/windows-server/remote/remote-desktop-services/rds-plan-high-availability

###### Remote Desktop web client
https://docs.microsoft.com/en-us/windows-server/remote/remote-desktop-services/clients/remote-desktop-web-client-admin

###### What is FSLogix?
https://docs.microsoft.com/en-us/fslogix/overview

###### RDS Networkports
https://social.technet.microsoft.com/wiki/contents/articles/16164.rds-2012-which-ports-are-used-during-deployment.aspx

###### Disable TLS1 & 2
https://saputra.org/threads/disable-tls-1-1-and-1-0-on-windows-server-2019-with-iis-10-0.148/

###### Personal Session Desktop
https://microsoftplatform.blogspot.com/2015/06/new-rds-deployment-model-personal.html

###### Microsoft Edge Auto Launch .rdp Files
https://techcommunity.microsoft.com/t5/enterprise/always-open-specific-file-types/m-p/1555442/highlight/true#M2221

1. Download Edge ADMX Files
2. Create GPO

- User Configuration > Policies > Administrative Templates > Microsoft Edge > List of file types that should be automatically opened on download > Enable > rdp

- User Configuration > Policies > Administrative Templates > Microsoft Edge > URLs where the AutoOpenFileTypes can apply > Enable > https://rds-wa1.rds.lab
