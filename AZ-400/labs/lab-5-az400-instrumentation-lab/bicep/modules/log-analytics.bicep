@description('Name of the Log Analytics workspace')
param workspaceName string

@description('Location for the Log Analytics workspace')
param location string

resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2021-06-01' = {
  name: workspaceName
  location: location
  properties: {
    retentionInDays: 30
    features: {
      enableLogAccessUsingOnlyResourcePermissions: true
    }
  }
}

@description('The full resource ID of the Log Analytics workspace')
output workspaceId string = logAnalytics.id
