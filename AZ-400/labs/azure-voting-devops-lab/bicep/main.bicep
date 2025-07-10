param environment string = 'dev'
param location string = resourceGroup().location
param aksVersion string = '1.31.3'

// 🔧 Networking
module network 'network.bicep' = {
  name: 'network'
  params: {
    environment: environment
    location: location
  }
}


// 🧠 Network Watcher (force into this resource group)
module networkWatcher 'network-watcher.bicep' = {
  name: 'networkWatcher'
  scope: resourceGroup()
  params: {
    location: location
  }
}

// ☸️ AKS Cluster
module aks 'aks.bicep' = {
  name: 'aks'
  scope: resourceGroup()
  params: {
    environment: environment
    location: location
    subnetId: network.outputs.subnetId
    aksName: '${environment}-aks'
    aksVersion: aksVersion
  }
}

// 🔐 Key Vault
module keyvault 'keyvault.bicep' = {
  name: 'keyvault'
  params: {
    environment: environment
    location: location
  }
}

// 📊 Log Analytics
module loganalytics 'loganalytics.bicep' = {
  name: 'loganalytics'
  params: {
    environment: environment
  }
}
