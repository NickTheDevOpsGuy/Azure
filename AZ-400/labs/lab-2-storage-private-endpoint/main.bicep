@description('Location for all resources')
param location string = resourceGroup().location

@description('Prefix for Storage Account name (lowercase, alphanumeric)')
param storagePrefix string = 'stor'

@description('Name of Virtual Network')
param vnetName string = 'lab2-vnet'

@description('Name of Subnet')
param subnetName string = 'default'

// Variables
var storageAccountName = toLower('${storagePrefix}${uniqueString(resourceGroup().id)}')
var storagePrivateDnsZoneName = 'privatelink.blob.${environment().suffixes.storage}'

// Resources
resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

resource vnet 'Microsoft.Network/virtualNetworks@2022-09-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: '10.0.0.0/24'
          privateEndpointNetworkPolicies: 'Disabled' // Important for Private Endpoints
        }
      }
    ]
  }
}

resource privateEndpoint 'Microsoft.Network/privateEndpoints@2022-09-01' = {
  name: '${storageAccountName}-pe'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: '${storageAccountName}-pls'
        properties: {
          privateLinkServiceId: storageAccount.id
          groupIds: [
            'blob'
          ]
        }
      }
    ]
  }
}

resource privateDnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' = {
  name: storagePrivateDnsZoneName
  location: 'global'
}

resource dnsZoneLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = {
  name: '${vnetName}-dnslink'
  parent: privateDnsZone
  location: 'global'
  properties: {
    virtualNetwork: {
      id: vnet.id
    }
    registrationEnabled: false
  }
}

// Outputs
output storageAccountName string = storageAccount.name
output privateEndpointName string = privateEndpoint.name
output vnetNameOutput string = vnet.name
output privateDnsZoneName string = privateDnsZone.name