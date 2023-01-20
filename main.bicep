param location string = resourceGroup().location

param projectName string

// A unique name is generated and will be consistent wihtin a resource group, but different accros resource groups
param storageAccountName string = '${projectName}${uniqueString(resourceGroup().id)}'

// Specify a parameter with certain allowed values
@allowed([
  'dev'
  'test'
  'prod'
])
param environment string

param databricksWorkspaceName string = 'dbs_${projectName}'//'databricks${uniqueString(resourceGroup().id)}'


module delta_lake 'modules/delta_lake.bicep' = {
  name: 'EDW'
  params: {
    location: location
    databricksWorkspaceName: databricksWorkspaceName
    storageAccountName: storageAccountName
    environment: environment
    
  }
}
