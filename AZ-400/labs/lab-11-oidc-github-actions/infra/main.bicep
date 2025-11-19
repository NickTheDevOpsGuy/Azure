resource st 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'oidc${uniqueString(resourceGroup().id)}'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
