param environment string

resource vnet 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: '${environment}-vnet'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: ['10.0.0.0/16']
    }
    subnets: [
      {
        name: 'aks-subnet'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}

output vnetName string = vnet.name
