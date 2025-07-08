param environment string
param vnetName string

resource aks 'Microsoft.ContainerService/managedClusters@2023-01-01' = {
  name: '${environment}-aks'
  location: resourceGroup().location
  properties: {
    dnsPrefix: '${environment}-k8s'
    agentPoolProfiles: [
      {
        name: 'agentpool'
        count: 2
        vmSize: 'Standard_DS2_v2'
        mode: 'System'
        vnetSubnetID: resourceId('Microsoft.Network/virtualNetworks/subnets', vnetName, 'aks-subnet')
      }
    ]
    enableRBAC: true
  }
}
