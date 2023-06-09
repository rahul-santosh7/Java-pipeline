$resourceGroupName = 'pipelinetesting67'
$storageAccountName = 'statefile67'
$location = 'East US'
$sku = 'Standard_LRS'
$containerName = 'rahul'
$tenantId = '$(tenant_id)'
$clientId = '$(client_id)'
$clientSecret = '$(client_secret)'

# Create the credentials object
$credentials = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList ($clientId, (ConvertTo-SecureString -String $clientSecret -AsPlainText -Force)) 

# Sign in to Azure
Connect-AzAccount -TenantId $tenantId -ServicePrincipal -Credential $credentials

# Create the resource group
$resourceGroup = Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue
if ($resourceGroup -eq $null) {
    $resourceGroup = New-AzResourceGroup -Name $resourceGroupName -Location $location
}

# Create the storage account
$storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName -ErrorAction SilentlyContinue
if ($storageAccount -eq $null) {
    $storageAccount = New-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName -Location $location -SkuName $sku
}

# Retrieve the storage context
$storageContext = $storageAccount.Context

# Create the container
$container = Get-AzStorageContainer -Context $storageContext -Name $containerName -ErrorAction SilentlyContinue
if ($container -eq $null) {
    $container = New-AzStorageContainer -Context $storageContext -Name $containerName -Permission Container
}
