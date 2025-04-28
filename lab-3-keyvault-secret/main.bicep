@description('Location for all resources')
param location string = resourceGroup().location

@description('Prefix for the Key Vault name')
param keyVaultPrefix string = 'kv'

@description('Name of the secret to create')
param secretName string = 'sampleSecret'

@secure()
@description('Value of the secret')
param secretValue string

@description('Object ID of the admin user (Azure AD Object ID)')
param adminObjectId string

// Create a globally unique Key Vault name using prefix + hash
var keyVaultName = toLower('${keyVaultPrefix}${uniqueString(resourceGroup().id)}')

resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    accessPolicies: [
      {
        tenantId: subscription().tenantId
        objectId: adminObjectId
        permissions: {
          secrets: [
            'get'
            'list'
            'set'
            'delete'
          ]
        }
      }
    ]
    enabledForDeployment: true
    enabledForTemplateDeployment: true
    enableSoftDelete: true
    softDeleteRetentionInDays: 7
  }
}

resource keyVaultSecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: secretName
  properties: {
    value: secretValue
  }
}

output keyVaultName string = keyVault.name
output createdSecretName string = keyVaultSecret.name