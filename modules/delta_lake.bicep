// variables that may vary accros environments
param location string

// A unique name is generated and will be consistent wihtin a resource group, but different accros resource groups
param storageAccountName string
// Specify a parameter with certain allowed values
@allowed([
  'dev'
  'test'
  'prod'
])
param environment string

param databricksWorkspaceName string

var storageAccountSku = (environment == 'prod') ? 'Standard_GRS' : 'Standard_LRS'

var managedResourceGroupName = 'databricks-rg-${databricksWorkspaceName}-${uniqueString(databricksWorkspaceName, resourceGroup().id)}'

var databricksSku = (environment == 'prod') ? 'premium' : 'trial'


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






resource databricksWorkspace 'Microsoft.Databricks/workspaces@2018-04-01' = {
  name: databricksWorkspaceName
  location: location
  sku: {
    name: databricksSku
  }
  properties: {
    managedResourceGroupId: subscriptionResourceId('Microsoft.Resources/resourceGroups', managedResourceGroupName)
    authorizations: []
  }

}
