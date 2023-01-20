param location string = resourceGroup().location

param databricksWorkspaceName string = 'dbs_workspace'//'databricks${uniqueString(resourceGroup().id)}'

var managedResourceGroupName = 'databricks-rg-${databricksWorkspaceName}-${uniqueString(databricksWorkspaceName, resourceGroup().id)}'

resource databricksWorkspace 'Microsoft.Databricks/workspaces@2018-04-01' = {
  name: databricksWorkspaceName
  location: location
  sku: {
    name: 'trial'
  }
  properties: {
    managedResourceGroupId: subscriptionResourceId('Microsoft.Resources/resourceGroups', managedResourceGroupName)
    authorizations: []
  }

}
