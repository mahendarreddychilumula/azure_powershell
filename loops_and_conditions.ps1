##using of if condition 
if(Get-AzResourceGroup -ResourceGroupName "mahendar" ){
    write-host("the rg is prasent")
 } else {
    $resorce_group = @{ 
        name = 'mahendar'
        location = 'East US'
        }
         New-AzResourceGroup @resorce_group
    
 }

 if(Get-AzVirtualNetwork -Name "mahi_vnet" -ResourceGroupName "mahendar"){
    write-host("the vnet is prasent")
 } else {
    $vnet = @{
        Name = 'mahi_vnet'
        ResourceGroupName = $resorce_group.name
        Location = $resorce_group.location
        Addressprefix = '10.10.0.0/16'
       }
       $VirtualNetwork = New-AZVirtualNetwork @vnet
    
 }


 ## using of for loop in powershell

 $array = @("item1", "item2", "item3")
for($i = 0; $i -lt $array.length; $i++) { New-item -path C:\ -Name $i -Type directory }



## using of for each loop


 $fruits= "apple", "orange", "guava", "pomegranate", "Mango"  
 foreach ($item in $fruits)  
{ 
    New-item -path C:\Users\mahen\OneDrive\Desktop -Name $item -Type directory  
} 


1..101 | foreach-Object -Parallel {
    $_
}