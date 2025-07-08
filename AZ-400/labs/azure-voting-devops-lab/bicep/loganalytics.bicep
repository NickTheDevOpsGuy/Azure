param environment string

resource logWorkspace 'Microsoft.OperationalInsights/workspaces@2021-06-01' = {
  name: '${environment}-log'
  location: resourceGroup().location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
  }
}

output logAnalyticsWorkspaceId string = logWorkspace.id
