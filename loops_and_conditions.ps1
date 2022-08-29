##using of if condition 
if(Get-AzVM -ResourceGroupName "mahendar" -Name "mahendar"){
    write-host("thevm is prasent")
 } else {
    $resorce_group = @{ 
        name = 'mahendar'
        location = 'East US'
        }
         New-AzResourceGroup @resorce_group
    
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