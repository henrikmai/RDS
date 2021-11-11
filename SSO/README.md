1. copy web.config to C:\Windows\Web\RDWeb\Pages
2. copy default.aspx to C:\Windows\Web\RDWeb\Pages\en-US
3. create a GPO for Computer
* Computer Configuration – Policies – Administrative Templates – System – Credentials Delegation - Allow delegating default credentials
* TERMSRV/rds-cb1.rds.lab
* TERMSRV/*.rds.lab
* TERMSRV/*
* Computer Configuration – Policies – Administrative Templates – Windows Components – Internet Explorer – Internet Control Panel – Security Page - Site to Zone Assignment List
* *.rds.lab
* Value: 2
 * Computer Configuration – Policies – Administrative Templates – Windows Components – Internet Explorer – Internet Control Panel – Security Page - Trusted Sites Zones  - Logon options
* Automatic logon with current username and password
4. create a GPO User
* User Configuration – Policies – Administrative Templates – Windows Components – Internet Explorer – Internet Control Panel – Security Page - Site to Zone Assignment List
* *.rds.lab
* Value: 2
* User Configuration – Policies – Administrative Templates – Windows Components – Internet Explorer – Internet Control Panel – Security Page - Trusted Sites Zones  - Logon options
* Automatic logon with current username and password
* User Configuration – Policies – Administrative Templates – Windows Components – Remote Desktop Services – Remote Desktop Connection Client - Specify SHA1 thumbprints of certificates representing trusted .rdp publishers
* THUMBPRINT HERE
