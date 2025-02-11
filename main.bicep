param storageName string = 'stg${uniqueString(resourceGroup().id)}'

resource storage 'Microsoft.Storage/storageAccounts@2021-02-01' = {
    name: storageName
    location: resourceGroup().location
    kind: 'StorageV2'
    sku: {
        name: 'Standard_LRS'
    }
}

resource service 'Microsoft.Storage/storageAccounts/fileServices@2021-02-01' = {
    name: 'default'
    parent: storage
}

resource share 'Microsoft.Storage/storageAccounts/fileServices/shares@2021-02-01' = {
    name: 'share1'
    parent: service
}
