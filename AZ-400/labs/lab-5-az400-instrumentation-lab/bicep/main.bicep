@description('Location for all resources')
param location string = resourceGroup().location

@description('Environment name (dev, test, prod)')
param environment string = 'dev'

@description('A unique suffix generated from the resource group ID')
param uniqueStringSuffix string = uniqueString(resourceGroup().id)

@description('Web app name')
param webAppName string = 'webapp-${environment}-${uniqueStringSuffix}'

// Naming variables
var workspaceName = 'log-${environment}'
var appInsightsName = 'appinsights-${environment}'
var planName = 'appserviceplan-${environment}-${uniqueStringSuffix}'

// Log Analytics Workspace
module logAnalytics 'modules/log-analytics.bicep' = {
  name: 'logAnalytics'
  params: {
    workspaceName: workspaceName
    location: location
  }
}

// Application Insights (depends on Log Analytics workspace)
module appInsights 'modules/app-insights.bicep' = {
  name: 'appInsights'
  params: {
    appInsightsName: appInsightsName
    location: location
    workspaceResourceId: logAnalytics.outputs.workspaceId
  }
  dependsOn: [
    logAnalytics
  ]
}

// Web App with App Insights instrumentation
module webApp 'modules/webapp.bicep' = {
  name: 'webApp-${environment}'
  params: {
    location: location
    environment: environment
    appInsightsKey: appInsights.outputs.instrumentationKey
    webAppName: webAppName
    planName: planName
  }
  dependsOn: [
    appInsights
  ]
}

// Outputs for testing or CI/CD reference
output appInsightsConnectionString string = appInsights.outputs.connectionString
output appInsightsInstrumentationKey string = appInsights.outputs.instrumentationKey
output logAnalyticsWorkspaceId string = logAnalytics.outputs.workspaceId
output webAppName string = webApp.outputs.webAppName // ✅ Added for deploy.sh compatibility
