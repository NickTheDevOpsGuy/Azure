@description('Environment name (e.g. dev, staging, prod)')
param environment string

@description('Azure location')
param location string

@description('Virtual Network address space')
param addressPrefix string = '10.1.0.0/16'

@description('Subnet address prefix')
param subnetPrefix string = '10.1.1.0/24'

var vnetName = '${environment}-vnet'
var subnetName = '${environment}-subnet'

resource vnet 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
  }
}

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2023-04-01' = {
  name: subnetName
  parent: vnet
  properties: {
    addressPrefix: subnetPrefix
  }
}

output vnetName string = vnet.name
output subnetName string = subnet.name
output subnetId string = subnet.id
