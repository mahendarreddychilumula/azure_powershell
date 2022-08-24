$Username = "MyUser"
$Password = 'Password123!' | ConvertTo-SecureString -Force -AsPlainText
$Credential = New-Object -TypeName PSCredential -ArgumentList ($Username, $Password) 

New-AzVm `
    -ResourceGroupName 'mahendar' `
    -Name 'myVM' `
    -Location 'EastUS' `
    -VirtualNetworkName 'mahi_vnet' `
    -SubnetName 'Subnet' `
    -SecurityGroupName 'myNetworkSecurityGroup' `
    -PublicIpAddressName 'my-pip' `
    -OpenPorts 80,3389 `
    -size 'Standard_D4S_v3'`
    -credential $credential 
    Invoke-AzVMRunCommand -ResourceGroupName 'mahendar' -VMName 'myVM' -CommandId 'RunPowerShellScript' -ScriptString 
'Install-WindowsFeature -Name Web-Server -IncludeManagementTools'