param location string = resourceGroup().location

// A unique name is generated and will be consistent wihtin a resource group, but different accros resource groups
param storageAccountName string = 'template${uniqueString(resourceGroup().id)}'

// Specify a parameter with certain allowed values
@allowed([
  'dev'
  'test'
  'prod'
])
param environment string

// variables that may vary accros environments
var storageAccountSku = (environment == 'prod') ? 'Standard_GRS' : 'Standard_LRS'


resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: storageAccountSku
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}
