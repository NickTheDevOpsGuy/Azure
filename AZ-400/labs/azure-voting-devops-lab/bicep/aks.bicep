@description('AKS cluster name')
param aksName string

@description('Environment name (e.g. dev, staging, prod)')
param environment string

@description('Azure location')
param location string

@description('Subnet resource ID to attach the AKS cluster to')
param subnetId string

@description('Kubernetes version')
param aksVersion string = '1.28.5'

resource aks 'Microsoft.ContainerService/managedClusters@2024-05-01' = {
  name: aksName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    dnsPrefix: '${environment}-aks'
    kubernetesVersion: aksVersion
    agentPoolProfiles: [
      {
        name: 'nodepool1'
        count: 1
        vmSize: 'Standard_DS2_v2'
        osType: 'Linux'
        type: 'VirtualMachineScaleSets'
        mode: 'System'
        vnetSubnetID: subnetId
      }
    ]
    networkProfile: {
      networkPlugin: 'azure'
      serviceCidrs: [
        '10.240.0.0/16'
      ]
      dnsServiceIP: '10.240.0.10'
    }
    aadProfile: {
      managed: true
      enableAzureRBAC: true
    }
  }
}
