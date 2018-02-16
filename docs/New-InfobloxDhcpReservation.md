---
external help file: UMN-Infoblox-help.xml
Module Name: UMN-Infoblox
online version: 
schema: 2.0.0
---

# New-InfobloxDhcpReservation

## SYNOPSIS
Create a new host object for doing DHCP reservations

## SYNTAX

```
New-InfobloxDhcpReservation [[-cookie] <WebRequestSession>] [[-uriBase] <String>] [[-host_name] <String>]
 [[-new_IPv4] <String>] [[-ipv4Net] <String>] [[-mac] <String>]
```

## DESCRIPTION
For use with DHCP reservations by mac address

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
New-InfobloxDhcpReservation -cookie $cookie -uriBase $uriBase -host_name $host_name -new_IPv4 $new_ipV4 -ipv4Net $ipv4net -mac $mac
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

### -ipv4Net
{{Fill ipv4Net Description}}

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

### -mac
{{Fill mac Description}}

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

## RELATED LINKS

