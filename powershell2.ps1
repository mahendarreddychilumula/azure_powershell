$Username = "MyUser"
$Password = 'Password123!' | ConvertTo-SecureString -Force -AsPlainText
$Credential = New-Object -TypeName PSCredential -ArgumentList ($Username, $Password) 

New-AzVm `
    -ResourceGroupName 'mahendar' `
    -Name 'myVM1' `
    -Location 'EastUS' `
    -VirtualNetworkName 'mahi_vnet' `
    -SubnetName 'Subnet' `
    -SecurityGroupName 'myNetworkSecurityGroup' `
    -PublicIpAddressName 'my-pip1' `
    -OpenPorts 80,3389,445 `
    -size 'Standard_D4S_v3'`
    -credential $credential 

    Invoke-AzVmRunCommand `
    -ResourceGroupName 'mahendar' `
    -VMName 'myVM1' `
    -CommandId 'RunPowerShellScript' `
    -ScriptPath 'C:\Users\mahen\OneDrive\Desktop\script1.ps1'

    # Set-AzVMExtension -ResourceGroupName "mahendar" `
    # -ExtensionName "chrome" `
    # # -VMName "myVM1" `
    # # -Location "EastUS" `
    # # -Publisher Microsoft.Compute `
    # # -ExtensionType CustomScriptExtension `
    # # -TypeHandlerVersion 1.8 `
    # # -SettingString '{"commandToExecute":"powershell Add-WindowsFeature Web-Server; powershell Add-Content -Path \"C:\\inetpub\\wwwroot\\Default.htm\" -Value $($env:computername)"}'