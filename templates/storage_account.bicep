param location string = resourceGroup().location

// A unique name is generated and will be consistent wihtin a resource group, but different accros resource groups
param storageAccountName string = 'template${uniqueString(resourceGroup().id)}'

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}
