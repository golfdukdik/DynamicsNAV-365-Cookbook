#install-module navcontainerhelper -force

# set to $true to accept the eula (https://go.microsoft.com/fwlink/?linkid=861843)
$accept_eula = $true

# set the name of your container (must be 15 characters or less)
$containername = 'navbcexsys'

# set image to use to create container (see here for available images: https://hub.docker.com/_/microsoft-businesscentral-sandbox﻿)
$bcDockerImage = 'mcr.microsoft.com/businesscentral/onprem'

# the user you use to login to the Business Central client (is a SUPER user)
$userName = "admin"
$password = ConvertTo-SecureString -String "P@ssw0rd" -AsPlainText -Force

# set the secure Url to your Business Central license file (leave blank to use the demo license)
$licenseFileUri = ''

$credential = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $userName, $password

New-NavContainer -accept_eula:$accept_eula `
                 -containername $containername `
                 -auth UserPassword `
                 -Credential $credential `
                 -licenseFile $licenseFileUri `
                 -doNotExportObjectsToText `
                 -usessl:$false `
                 -updateHosts `
                 -assignPremiumPlan `
                 -shortcuts Desktop `
                 -imageName $bcdockerimage `
                 -useBestContainerOS