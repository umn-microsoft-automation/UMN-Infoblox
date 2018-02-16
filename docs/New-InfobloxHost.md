---
external help file: UMN-Infoblox-help.xml
Module Name: UMN-Infoblox
online version: 
schema: 2.0.0
---

# New-InfobloxHost

## SYNOPSIS
Create a new Host object with IPv4 and IPv6 Address

## SYNTAX

```
New-InfobloxHost [[-cookie] <WebRequestSession>] [[-uriBase] <String>] [[-host_name] <String>]
 [[-new_IPv4] <String>] [[-new_IPv6] <String>] [[-ipv4Net] <String>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
New-InfobloxHost -cookie $cookie -uribase $uriBase -host_name $host_name -new_IPv4 $new_ipV4 -new_IPv6 $new_ipv6 -ipv4net $ipv4net
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

### -host_name
{{Fill host_name Description}}

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

### -new_IPv4
{{Fill new_IPv4 Description}}

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

### -new_IPv6
{{Fill new_IPv6 Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 5
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
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES
Use other module commands to generate a list of IP's to associate to a new host entry.

## RELATED LINKS

