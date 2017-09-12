###
# Copyright 2017 University of Minnesota, Office of Information Technology

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
## Modules for infoblox
# It is assumed that a Connection has already been established and the cookie is being passed to many of these functions.
# Use 'Connect-Infoblox' to return a $cookie --

#region Connect-Infoblox
Function Connect-Infoblox{
<#
    .SYNOPSIS
	    Core function - retrieve cookie for API access to infoblox
    .DESCRIPTION
	
    .PARAMETER InfobloxCred
        PS credential of user that has access

    .PARAMETER uriBase
        FQDN of infoblox host including version, example 'https://myhost.mycompany.com/wapi/v1.7.1'

    .PARAMETER SkipCertificateCheck
        Ignore bad SSL Certificates

    .EXAMPLE
	    Connect-Infoblox -InfobloxCreds $infobloxCreds -uriBase $uriBase
    .NOTES
	    For legacy automation systems dealing with cookies - 
        -UseBasicParsing is included on the InvokeWebRequest - needed parsing for Orchestrator
#>


    [CmdletBinding()]
    param(

        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCredential]$InfobloxCreds,

        [parameter(Mandatory)]
        [string]$uriBase,

        [switch]$SkipCertificateCheck
    )
     
     if ($SkipCertificateCheck -and $PSVersionTable.PSVersion.Major -lt 6){
add-type @"
    using System.Net;
    using System.Security.Cryptography.X509Certificates;
    public class TrustAllCertsPolicy : ICertificatePolicy {
        public bool CheckValidationResult(
            ServicePoint srvPoint, X509Certificate certificate,
            WebRequest request, int certificateProblem) {
            return true;
        }
    }
"@
            [System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy
    }
            $uri  = "$uriBase/grid"
            if ($SkipCertificateCheck -and $PSVersionTable.PSVersion.Major -eq 6){$grid = Invoke-WebRequest -uri $uri -Method Get -Credential $InfobloxCreds -SessionVariable cookie -UseBasicParsing -SkipCertificateCheck}
            else{$grid = Invoke-WebRequest -uri $uri -Method Get -Credential $InfobloxCreds -SessionVariable cookie -UseBasicParsing}
            return ($cookie)
}
#endregion

#region Get-InfobloxHost
Function Get-InfobloxHost{

<#
.SYNOPSIS
	Get host by FQDN
.DESCRIPTION
	
.EXAMPLE
	Get-InfobloxHost -cookie $cookie -uriBase $uriBase -host_name $host_name
.NOTES
	General notes
#>
    
    [CmdletBinding()]
    Param
    (
        [ValidateNotNullOrEmpty()]
        [Microsoft.PowerShell.Commands.WebRequestSession]$cookie,

        [ValidateNotNullOrEmpty()]
        [string]$uriBase,

        [ValidateNotNullOrEmpty()]
        [string]$host_name
    )
    
    $host_name = $host_name.ToLower()
    $uri  = "$uriBase/record:host?name=$host_name&_return_fields=aliases,ipv4addrs"
    Invoke-RestMethod -uri $uri -Method Get -WebSession $cookie
}
#endregion

#region Get-InfobloxIPv4Net
Function Get-InfobloxIPv4Net{
<#
.SYNOPSIS
	Get  IPv4 Network
.DESCRIPTION
	Get a network stack from infoblox
.EXAMPLE
	Get-InflobloxIPv4Net -cookie $cookie -uriBase $uriBase -ipv4Net $ipv4net
.NOTES
	General notes
#>

    [CmdletBinding()]
    Param
    (
        [ValidateNotNullOrEmpty()]
        [Microsoft.PowerShell.Commands.WebRequestSession]$cookie,

        [ValidateNotNullOrEmpty()]
        [string]$uriBase,

        [ValidateNotNullOrEmpty()]
        [string]$ipv4Net
    )
    $uri = "$uriBase/network?network=$ipv4Net"
    Invoke-RestMethod -uri $uri -Method Get -WebSession $cookie
}
#endregion

#region Get-InfobloxIPv4IP
Function Get-InfobloxIPv4IP{
<#
.SYNOPSIS
	Get reference to specific IPv4 address
.DESCRIPTION
	
.EXAMPLE
	Get-InflobloxIPv4IP -cookie $cookie -uriBase $uriBase -ipv4Address $ipv4Address
.NOTES
	Check 'types' and look for HOST (NOT BULKHOST).  If types contains HOST, its in use
#>


    [CmdletBinding()]
    Param
    (
        [ValidateNotNullOrEmpty()]
        [Microsoft.PowerShell.Commands.WebRequestSession]$cookie,

        [ValidateNotNullOrEmpty()]
        [string]$uriBase,

        [ValidateNotNullOrEmpty()]
        [string]$ipv4Address
    )

    $uri = "$uriBase/ipv4address?ip_address=$ipv4Address"
    Invoke-RestMethod -uri $uri -Method Get -WebSession $cookie

}
#endregion

#region Get-InfobloxIPv4IPs
Function Get-InfobloxIPv4IPs{
<#
.SYNOPSIS
	Get reference to specific IPv4 network
.DESCRIPTION
	Get all Hosts in a specific IPv4 Network
.EXAMPLE
	Get-InfobloxIPv4ips -cookie $cookie -uriBase $uriBase -ipv4net $ipv4net
.NOTES
	
#>

    [CmdletBinding()]
    Param
    (
        [ValidateNotNullOrEmpty()]
        [Microsoft.PowerShell.Commands.WebRequestSession]$cookie,

        [ValidateNotNullOrEmpty()]
        [string]$uriBase,

        [ValidateNotNullOrEmpty()]
        [string]$ipv4Net
    )

    $uri = "$uriBase/ipv4address?network=$ipv4Net"
    Invoke-RestMethod -uri $uri -Method Get -WebSession $cookie

}
#endregion

#region Get-InfobloxIPv4Available
Function Get-InfobloxIPv4Available{

<#
.SYNOPSIS
	Get an available IPv4 address
.DESCRIPTION
	Check for, and retrieve an available IPv4 address
.EXAMPLE
	Get-InfobloxIP4Available -cookie $cookie -uriBase $uriBase -ipv4net $ipv4net -domainSuffix -$domainSuffix
.NOTES
	
#>


    [CmdletBinding()]
    Param
    (
        [ValidateNotNullOrEmpty()]
        [Microsoft.PowerShell.Commands.WebRequestSession]$cookie,

        [ValidateNotNullOrEmpty()]
        [string]$uriBase,

        [ValidateNotNullOrEmpty()]
        [string]$ipv4Net,
        
        [ValidateNotNullOrEmpty()]
        [string]$domainSuffix
    )
    
    $ipv4IPs = Get-InfobloxIPv4IPs -cookie $cookie -uriBase $uriBase -ipv4Net $ipv4Net
    $ipFound = $false
    foreach ($ip in $ipv4IPs){
        if ($ip.types -notcontains "HOST" -and $ip.lease_state -eq "FREE") # IF it returns a single entry this should be the bulk host.  < 1 = router, >1 its tied to host record so don't touch it
        {
            $ipFound = $true 
            return $ip.ip_address
        }
    }
    if(-not $ipFound){return "unable to find IPv4 Address, exiting"}

}
#endregion

#region Get-InfobloxIPv6IP
Function Get-InfobloxIPv6IP{
<#
.SYNOPSIS
	Get reference to specific IPv6 address
.DESCRIPTION
	
.EXAMPLE
	Get-InflobloxIPv6IP -cookie $cookie -uriBase $uriBase -ipv6Address $ipv6Address
.NOTES
	
#>


    [CmdletBinding()]
    Param
    (
        [ValidateNotNullOrEmpty()]
        [Microsoft.PowerShell.Commands.WebRequestSession]$cookie,

        [ValidateNotNullOrEmpty()]
        [string]$uriBase,

        [ValidateNotNullOrEmpty()]
        [string]$ipv6address
    )

    $uri  = "$uriBase/record:host_ipv6addr?ipv6addr=$ipv6address"
    Invoke-RestMethod -uri $uri -Method Get -WebSession $cookie

}
#endregion

#region Get-InfobloxIPbyMac
function Get-InfobloxIPbyMac {
<#
.SYNOPSIS
	Get IP information by MAC address
.DESCRIPTION
	
.EXAMPLE
	Get-InfobloxIPbyMac -cookie $cookie -uriBase $uriBase -ipv4net $ipv4net -mac $mac
.NOTES
#>
    
    [CmdletBinding()]
    param(

        [ValidateNotNullOrEmpty()]
        [Microsoft.PowerShell.Commands.WebRequestSession]$cookie,

        [string]$uriBase,

        [ValidateNotNullOrEmpty()]
        [string]$ipv4Net,

        [ValidatePattern("([a-zA-Z0-9]{2}:){5}[a-zA-Z0-9]{2}")]
        [string]$mac

    )

    $uri = "$uriBase/ipv4address?network=$ipv4Net&mac_address=$mac"
    $ipv4IPs =  Invoke-RestMethod -uri $uri -Method Get -WebSession $cookie
    $activeIP = $ipv4IPs | Where-Object {$_.lease_state -eq 'ACTIVE'}
    if ($activeIP -ne $null){return ($activeIP.ip_address)}
    else{throw "Failed to get single IP info $ipv4IPs"}
}
#endregion

#region New-InfobloxHost
Function New-InfobloxHost{

<#
.SYNOPSIS
	Create a new Host object with IPv4 and IPv6 Address
.DESCRIPTION
	
.EXAMPLE
	New-InfobloxHost -cookie $cookie -uribase $uriBase -host_name $host_name -new_IPv4 $new_ipV4 -new_IPv6 $new_ipv6 -ipv4net $ipv4net
.NOTES
	Use other module commands to generate a list of IP's to associate to a new host entry.
#>



    [CmdletBinding()]
    Param
    (
        [ValidateNotNullOrEmpty()]
        [Microsoft.PowerShell.Commands.WebRequestSession]$cookie,

        [ValidateNotNullOrEmpty()]
        [string]$uriBase,

        [ValidateNotNullOrEmpty()]
        [string]$host_name,

        [ValidateNotNullOrEmpty()]
        [string]$new_IPv4,

        [string]$new_IPv6,

        [ValidateNotNullOrEmpty()]
        [string]$ipv4Net
    )
    $host_name = $host_name.ToLower()
    $uri = "$uriBase/record:host"
    if ($new_IPv6)
    {
        $JSON = @{name=$host_name;ipv4addrs=@(@{ipv4addr=$new_IPv4;configure_for_dhcp=$true;match_client="RESERVED"});
            ipv6addrs=@(@{ipv6addr=$new_IPv6});
            extattrs=@{Custom1=@{value=$ipv4Net};Custom2=@{value="default 2 hour"}}} | ConvertTo-Json
    }
    else
    {
        $JSON = @{name=$host_name;ipv4addrs=@(@{ipv4addr=$new_IPv4;configure_for_dhcp=$true;match_client="RESERVED"});
            extattrs=@{Custom1=@{value=$ipv4Net};Custom2=@{value="default 2 hour"}}} | ConvertTo-Json
    }
    Invoke-RestMethod -Uri $uri -Body $JSON -ContentType "application/json" -Method Post -WebSession $cookie

}
#endregion

#region New-InfobloxDhcpReservation
Function New-InfobloxDhcpReservation{
<#
.SYNOPSIS
	Create a new host object for doing DHCP reservations
.DESCRIPTION
	For use with DHCP reservations by mac address
.EXAMPLE
	New-InfobloxDhcpReservation -cookie $cookie -uriBase $uriBase -host_name $host_name -new_IPv4 $new_ipV4 -ipv4Net $ipv4net -mac $mac
.NOTES
	
#>
    [CmdletBinding()]
    Param
    (
        [ValidateNotNullOrEmpty()]
        [Microsoft.PowerShell.Commands.WebRequestSession]$cookie,

        [ValidateNotNullOrEmpty()]
        [string]$uriBase,

        [ValidateNotNullOrEmpty()]
        [string]$host_name,

        [ValidatePattern("\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}")]
        [string]$new_IPv4,

        [ValidateNotNullOrEmpty()]
        [string]$ipv4Net,

        [ValidatePattern("([a-zA-Z0-9]{2}:){5}[a-zA-Z0-9]{2}")]
        [string]$mac
    )
    $host_name = $host_name.ToLower()
    $uri = "$uriBase/record:host"
    $JSON = @{name=$host_name;ipv4addrs=@(@{ipv4addr=$new_IPv4;configure_for_dhcp=$true;match_client="MAC_ADDRESS";mac=$mac});
        extattrs=@{Custom1=@{value=$ipv4Net};Custom2=@{value="default 2 hour"}}} | ConvertTo-Json    
    Invoke-RestMethod -Uri $uri -Body $JSON -ContentType "application/json" -Method Post -WebSession $cookie

}
#endregion

#region Remove-InfobloxHost
Function Remove-InfobloxHost{
<#
.SYNOPSIS
	Remove Host Record
.DESCRIPTION
	
.EXAMPLE
	Remove-InfobloxHost -cookie $cookie -uriBase $uriBase -host_name $host_name
.NOTES
	General notes
#>

  ## 

    [CmdletBinding()]
    Param
    (
        [ValidateNotNullOrEmpty()]
        [Microsoft.PowerShell.Commands.WebRequestSession]$cookie,

        [ValidateNotNullOrEmpty()]
        [string]$uriBase,

        [ValidateNotNullOrEmpty()]
        [string]$host_name
    )
    $host_name = $host_name.ToLower()
    ## Validate Host exists
    $ibHost = Get-InfobloxHost -cookie $cookie -uriBase $uriBase -host_name $host_name
    if ($ibHost -eq $null){throw "Infoblox Host Doesn't Exist"}
    # Aliases must be removed before removing the host record
    if ($ibHost.aliases){}## waiting for enough permissions to see all the aliases and remove them
    $host_ref = $ibHost._ref
       
    $uri  = "$uriBase/$host_ref"
    #validate response
    if ((Invoke-RestMethod -uri $uri -Method Delete -WebSession $cookie) -ne $host_ref){throw "Infoblox Delete Failed"}

}
#endregion

Export-ModuleMember -Function *