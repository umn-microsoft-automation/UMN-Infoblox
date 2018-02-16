---
external help file: UMN-Infoblox-help.xml
Module Name: UMN-Infoblox
online version: 
schema: 2.0.0
---

# Get-InfobloxIPv4Available

## SYNOPSIS
Get an available IPv4 address

## SYNTAX

```
Get-InfobloxIPv4Available [[-cookie] <WebRequestSession>] [[-uriBase] <String>] [[-ipv4Net] <String>]
 [[-domainSuffix] <String>]
```

## DESCRIPTION
Check for, and retrieve an available IPv4 address

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-InfobloxIP4Available -cookie $cookie -uriBase $uriBase -ipv4net $ipv4net -domainSuffix -$domainSuffix
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

### -ipv4Net
{{Fill ipv4Net Description}}

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

### -domainSuffix
{{Fill domainSuffix Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

