@description('Name of the Application Insights resource')
param appInsightsName string

@description('Location for the Application Insights resource')
param location string

@description('The full resource ID of the Log Analytics workspace')
param workspaceResourceId string

resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: appInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: workspaceResourceId // ✅ must be exact casing
  }
}

output instrumentationKey string = appInsights.properties.InstrumentationKey
