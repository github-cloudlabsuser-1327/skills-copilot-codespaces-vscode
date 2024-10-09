# Parameters
$resourceGroupName = "yourResourceGroupName"
$location = "yourLocation"
$storageAccountName = "yourStorageAccountName"
$skuName = "Standard_LRS"
$kind = "StorageV2"

# Login to Azure
Connect-AzAccount

# Create Resource Group if it doesn't exist
if (-not (Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue)) {
    New-AzResourceGroup -Name $resourceGroupName -Location $location
}

# Create Storage Account
try {
    $storageAccount = New-AzStorageAccount -ResourceGroupName $resourceGroupName `
                                            -Name $storageAccountName `
                                            -Location $location `
                                            -SkuName $skuName `
                                            -Kind $kind
    Write-Output "Storage account '$storageAccountName' created successfully."
} catch {
    Write-Error "Failed to create storage account: $_"
}