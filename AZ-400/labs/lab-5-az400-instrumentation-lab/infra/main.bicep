@description('Location for all resources')
param location string = resourceGroup().location

@description('Environment name (dev, test, prod)')
param environment string = 'dev'

@description('A unique suffix generated from the resource group ID')
param uniqueStringSuffix string = uniqueString(resourceGroup().id)

@description('Web app name')
param webAppName string = 'webapp-${environment}-${uniqueStringSuffix}'

var workspaceName = 'log-${environment}'
var appInsightsName = 'appinsights-${environment}'
var planName = 'appserviceplan-${environment}-${uniqueStringSuffix}'

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

module webApp 'modules/webapp.bicep' = {
  name: 'webApp-${environment}'
  params: {
    location: location
    environment: environment
    appInsightsKey: appInsights.outputs.instrumentationKey
    webAppName: webAppName
    planName: planName
  }
}

output appInsightsInstrumentationKey string = appInsights.outputs.instrumentationKey
output logAnalyticsWorkspaceId string = logAnalytics.outputs.workspaceId
