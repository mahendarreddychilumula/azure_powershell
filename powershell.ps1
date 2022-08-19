$resorce_group = @{ 
name = 'mahendar'
location = 'eastus'
}
New-AzResourceGroup @resorce_group
$vnet = @{
 Name = 'mahi_vnet'
 ResourceGroupName = $resorce_group.name
 Location = $resorce_group.location
 Addressprefix = '10.10.0.0/16'
}
$VirtualNetwork = New-AZVirtualNetwork @vnet
$subnet = @{
    Name = 'mahi_subnet'
    VirtualNetwork = $VirtualNetwork
    AddressPrefix = '10.10.0.0/24'
}
$subnetconfig = Add-AzVirtualNetworkSubnetConfig @subnet
Remove-AzResourceGroup -name mahendar -Force

if (!(Get-AzResourceGroup mahendar -ErrorAction SilentlyContinue))
  { New-AzResourceGroup @resorce_group }
else
   {"found"} 
   