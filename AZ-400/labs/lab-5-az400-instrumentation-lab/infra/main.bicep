@description('Location for all resources')
param location string = resourceGroup().location

@description('Environment name (dev, test, prod)')
param environment string = 'dev'

var workspaceName = 'log-${environment}'
var appInsightsName = 'appinsights-${environment}'

module logAnalytics 'modules/log-analytics.bicep' = {
  name: 'logAnalytics'
  params: {
    workspaceName: workspaceName
    location: location
  }
}

module appInsights 'modules/app-insights.bicep' = {
  name: 'appInsights'
  params: {
    appInsightsName: appInsightsName
    location: location
    workspaceResourceId: logAnalytics.outputs.workspaceResourceId
  }
}

output appInsightsInstrumentationKey string = appInsights.outputs.instrumentationKey
output logAnalyticsWorkspaceId string = logAnalytics.outputs.workspaceId
