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
    Name = 'subnet'
    VirtualNetwork = $VirtualNetwork
    AddressPrefix = '10.10.10.0/24'
}
$subnetconfig = Add-AzVirtualNetworkSubnetConfig @subnet
$virtualNetwork | Set-AzVirtualNetwork

##Remove-AzResourceGroup -name mahendar -Force


#$publicip = @{
 # name = 'my-pip' 
  #ResourceGroupName = $resorce_group.name 
  #location = $resorce_group.location 
  #AllocationMethod ='Static'
  #IpAddressVersion = 'IPv4'
  #Sku = 'Standard'
#}

#$pip = New-AzPublicIpAddress @publicip 



#$nic = New-AzNetworkinterface -Name 'my-nic' -ResourceGroupName $resorce_group.name -PublicIpAddressId $pip.Id -Location $resorce_group.location -SubnetId "/subscriptions/a3d75c10-c135-4e6b-8f4e-f22711d010ef/resourceGroups/mahendar/providers/Microsoft.Network/virtualNetworks/mahi_vnet/subnets/subnet"

$Username = "MyUser"
$Password = 'Password123!' | ConvertTo-SecureString -Force -AsPlainText
$Credential = New-Object -TypeName PSCredential -ArgumentList ($Username, $Password) 

New-AzVm `
    -ResourceGroupName $resorce_group.name `
    -Name 'myVM' `
    -Location $resorce_group.location `
    -VirtualNetworkName $VirtualNetwork.name `
    -SubnetName 'subnet' `
    -SecurityGroupName 'myNetworkSecurityGroup' `
    -PublicIpAddressName 'myip' `
    -OpenPorts 80,3389 `
    -size 'Standard_D4S_v3'`
    -credential $credential 

    $vmName = 'myVM'
    $imageName = 'myImage'
    $rgName = 'mahendar'
    $location = 'EastUS'

    Stop-AzVM -ResourceGroupName $rgName -Name $vmName -Force
    Set-AzVm -ResourceGroupName $rgName -Name $vmName -Generalized
    $vm = Get-AzVM -Name $vmName -ResourceGroupName $rgName
    $image = New-AzImageConfig -Location $location -SourceVirtualMachineId $vm.Id
    New-AzImage -Image $image -ImageName $imageName -ResourceGroupName $rgName

$storage =@{
  ResourceGroupName = $resorce_group.name
  name     = 'mahendar1234567890'
  SkuName  = 'Premium_LRS'
  Location = $resorce_group.location
}
New-AzStorageAccount  @storage


##if (!(Get-AzResourceGroup mahendar -ErrorAction SilentlyContinue))
  ##{ New-AzResourceGroup @resorce_group }
##else
  ## {"found"} 
 
 
  ##$networkinterface = @{
  ##Name ='my-nic' 
  ##ResourceGroupName = $resorce_group.name 
  ##Location =  $resorce_group.location
  ##SubnetId = $subnetconfig.id  
 ## IpConfigurationName = $PIP.name}

 #Add-AzVirtualNetworkSubnetConfig -Name backendSubnet -VirtualNetwork $virtualNetwork -AddressPrefix "10.10.2.0/24"
#$virtualNetwork | Set-AzVirtualNetwork
   