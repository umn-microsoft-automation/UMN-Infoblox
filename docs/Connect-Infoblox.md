---
external help file: UMN-Infoblox-help.xml
Module Name: UMN-Infoblox
online version: 
schema: 2.0.0
---

# Connect-Infoblox

## SYNOPSIS
Core function - retrieve cookie for API access to infoblox

## SYNTAX

```
Connect-Infoblox [[-InfobloxCreds] <PSCredential>] [-uriBase] <String> [-SkipCertificateCheck]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Connect-Infoblox -InfobloxCreds $infobloxCreds -uriBase $uriBase
```

## PARAMETERS

### -InfobloxCreds
{{Fill InfobloxCreds Description}}

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -uriBase
FQDN of infoblox host including version, example 'https://myhost.mycompany.com/wapi/v1.7.1'

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SkipCertificateCheck
Ignore bad SSL Certificates

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES
For legacy automation systems dealing with cookies - 
   -UseBasicParsing is included on the InvokeWebRequest - needed parsing for Orchestrator

## RELATED LINKS

