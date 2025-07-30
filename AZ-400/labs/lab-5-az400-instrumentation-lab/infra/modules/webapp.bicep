@description('Name of the App Service plan')
param planName string

@description('Name of the Web App')
param webAppName string

@description('Location for the Web App')
param location string

@description('App Insights connection string')
param appInsightsKey string

@description('Environment name')
param environment string

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: planName
  location: location
  sku: {
    name: 'B1'
    tier: 'Basic'
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
  tags: {
    environment: environment
  }
}

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: webAppName
  location: location
  kind: 'app,linux'
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
    siteConfig: {
      linuxFxVersion: 'NODE|20-lts'
      appSettings: [
        {
          name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: appInsightsKey
        }
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: appInsightsKey
        }
        {
          name: 'WEBSITE_RUN_FROM_PACKAGE'
          value: '1'
        }
        {
          name: 'NODE_ENV'
          value: 'production'
        }
      ]
    }
  }
  identity: {
    type: 'SystemAssigned'
  }
  tags: {
    environment: environment
  }
}

output webAppName string = webApp.name
output webAppUrl string = 'https://${webApp.properties.defaultHostName}'
