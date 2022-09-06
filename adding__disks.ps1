for($i = 0; $i -lt 999; $i++)
{
    $rgName = 'mahendar'
$vmName = 'myVM1'
$location = 'East US'
$storageType = 'Premium_LRS'
$dataDiskName = $vmName +$i

$diskConfig = New-AzDiskConfig -SkuName $storageType -Location $location -CreateOption Empty -DiskSizeGB 128
$dataDisk1 = New-AzDisk -DiskName $dataDiskName -Disk $diskConfig -ResourceGroupName $rgName

$vm = Get-AzVM -Name $vmName -ResourceGroupName $rgName
$vm = Add-AzVMDataDisk -VM $vm -Name $dataDiskName -CreateOption Attach -ManagedDiskId $dataDisk1.Id -Lun 1

Update-AzVM -VM $vm -ResourceGroupName $rgName}







i=0 i>= ,i++