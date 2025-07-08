param environment string = 'dev'

module network 'network.bicep' = {
  name: 'network'
  params: {
    environment: environment
  }
}

module aks 'aks.bicep' = {
  name: 'aks'
  params: {
    environment: environment
    vnetName: network.outputs.vnetName
  }
}

module keyvault 'keyvault.bicep' = {
  name: 'keyvault'
  params: {
    environment: environment
  }
}

module loganalytics 'loganalytics.bicep' = {
  name: 'logs'
  params: {
    environment: environment
  }
}
