@description('App Insights name')
param appInsightsName string

@description('Location for the resource')
param location string

@description('Log Analytics workspace resource ID')
param workspaceResourceId string

resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: appInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: workspaceResourceId
  }
}

output instrumentationKey string = appInsights.properties.InstrumentationKey
output connectionString string = appInsights.properties.ConnectionString
output appInsightsResourceId string = appInsights.id
