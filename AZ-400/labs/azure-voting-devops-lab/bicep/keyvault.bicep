param environment string

resource keyVault 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: '${environment}-kv'
  location: resourceGroup().location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    accessPolicies: []
  }
}
