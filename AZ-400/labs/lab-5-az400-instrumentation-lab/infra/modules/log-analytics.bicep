@description('Name of the Log Analytics workspace')
param workspaceName string

@description('Location for the Log Analytics workspace')
param location string

resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2021-06-01' = {
  name: workspaceName
  location: location
  sku: {
    name: 'PerGB2018'
  }
  properties: {
    retentionInDays: 30
  }
}

output workspaceResourceId string = logAnalytics.id
output workspaceId string = logAnalytics.name
