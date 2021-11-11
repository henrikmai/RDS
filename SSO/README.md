1. copy web.config to C:\Windows\Web\RDWeb\Pages
2. copy default.aspx to C:\Windows\Web\RDWeb\Pages\en-US
3. create a GPO for Computer <br>
    Computer Configuration – Policies – Administrative Templates – System – Credentials Delegation - Allow delegation default credentials with NTLM-only server authentication
        TERMSRV/rds-cb1.rds.lab
        II. TERMSRV/*.rds.lab
        III. TERMSRV/*
    b. Computer Configuration – Policies – Administrative Templates – System – Credentials Delegation - Allow delegating default credentials
        I. TERMSRV/rds-cb1.rds.lab
        II. TERMSRV/*.rds.lab
        III. TERMSRV/*
    c. Computer Configuration – Policies – Administrative Templates – Windows Components – Internet Explorer – Internet Control Panel – Security Page - Site to Zone Assignment List
        I. *.rds.lab
        II. Value: 2
    d. Computer Configuration – Policies – Administrative Templates – Windows Components – Internet Explorer – Internet Control Panel – Security Page - Trusted Sites Zones  - Logon options
        I. Automatic logon with current username and password
4. create a GPO User
    a. User Configuration – Policies – Administrative Templates – Windows Components – Internet Explorer – Internet Control Panel – Security Page - Site to Zone Assignment List
        I. *.rds.lab
        II. Value: 2
    b. User Configuration – Policies – Administrative Templates – Windows Components – Internet Explorer – Internet Control Panel – Security Page - Trusted Sites Zones  - Logon options
        I. Automatic logon with current username and password
    c. User Configuration – Policies – Administrative Templates – Windows Components – Remote Desktop Services – Remote Desktop Connection Client - Specify SHA1 thumbprints of certificates representing trusted .rdp publishers
        I. <THUMBPRINT HERE>
    
