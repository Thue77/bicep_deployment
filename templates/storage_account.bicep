resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'templatestorageaccount01'
  location: 'westeurope'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}
