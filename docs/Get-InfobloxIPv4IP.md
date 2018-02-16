---
external help file: UMN-Infoblox-help.xml
Module Name: UMN-Infoblox
online version: 
schema: 2.0.0
---

# Get-InfobloxIPv4IP

## SYNOPSIS
Get reference to specific IPv4 address

## SYNTAX

```
Get-InfobloxIPv4IP [[-cookie] <WebRequestSession>] [[-uriBase] <String>] [[-ipv4Address] <String>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-InflobloxIPv4IP -cookie $cookie -uriBase $uriBase -ipv4Address $ipv4Address
```

## PARAMETERS

### -cookie
{{Fill cookie Description}}

```yaml
Type: WebRequestSession
Parameter Sets: (All)
Aliases: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -uriBase
{{Fill uriBase Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ipv4Address
{{Fill ipv4Address Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES
Check 'types' and look for HOST (NOT BULKHOST). 
If types contains HOST, its in use

## RELATED LINKS

