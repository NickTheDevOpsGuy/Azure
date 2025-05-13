param environment string = 'dev'
param location string = 'eastus2'
param deployWebApp bool = false
param appInsightsName string = 'appinsights-${environment}-nick'
param logAnalyticsName string = 'log-${environment}-nick'
param webAppName string = 'insightswebapp-${environment}-nick'

resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2021-06-01' = {
  name: logAnalyticsName
  location: location
  sku: {
    name: 'PerGB2018'
  }
  properties: {
    retentionInDays: 30
  }
}

resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: appInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalytics.id
  }
}

resource hostingPlan 'Microsoft.Web/serverfarms@2023-01-01' = if (deployWebApp) {
  name: 'asp-${environment}-nick'
  location: location
  sku: {
    name: 'B1'
    tier: 'Basic'
    capacity: 1
  }
}

resource webApp 'Microsoft.Web/sites@2023-01-01' = if (deployWebApp) {
  name: webAppName
  location: location
  properties: {
    serverFarmId: hostingPlan.id
    siteConfig: {
      appSettings: [
        {
          name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: appInsights.properties.InstrumentationKey
        }
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: appInsights.properties.ConnectionString
        }
        {
          name: 'WEBSITE_RUN_FROM_PACKAGE'
          value: '1'
        }
      ]
    }
  }
}

output appInsightsConnectionString string = appInsights.properties.ConnectionString
output appInsightsInstrumentationKey string = appInsights.properties.InstrumentationKey