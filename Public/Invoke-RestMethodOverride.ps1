﻿Function Invoke-RestMethodOverride {
    param ( 
        [Parameter(Mandatory=$true)][string]$Method,
        [Parameter(Mandatory=$true)][string]$URI,
        [Parameter(Mandatory=$true)][System.Management.Automation.PSCredential]$Credential,
        [Parameter(Mandatory=$false)]$Body=$null,
        [Parameter(Mandatory=$false)]$Headers=$null,
        [Parameter(Mandatory=$false)]$ContentType=$null
    )

    [SSLValidator]::OverrideValidation()

    Invoke-RestMethod -Method $Method -Uri $URI -Credential $Credential -Body $Body -Headers $Headers -ContentType $ContentType 

    [SSLValidator]::RestoreValidation()

}
