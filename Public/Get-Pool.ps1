﻿Function Get-Pool {
<#
.SYNOPSIS
    Retrieve the specified pool
.NOTES
    Pool names are case-specific.
#>

    param (
        [Parameter(Mandatory=$true)]$F5session,
        [Parameter(Mandatory=$true)][string]$PoolName
    )

    Write-Verbose "NB: Pool names are case-specific."

    #Build the URI for this pool
    $URI = $F5session.BaseURL + 'pool/{0}' -f ($PoolName -replace '[/\\]','~')

    Try {
        Invoke-RestMethodOverride -Method Get -Uri $URI -Credential $F5session.Credential -ErrorAction SilentlyContinue
    }
    Catch{
        Write-Error ("Failed to get the $PoolName pool.")
        Write-Error ("StatusCode:" + $_.Exception.Response.StatusCode.value__)
        Write-Error ("StatusDescription:" + $_.Exception.Response.StatusDescription)
    }

}
