New-AzGallery `
   -GalleryName 'myGallery' `
   -ResourceGroupName 'mahendar' `
   -Location 'EastUS' `
   -Description 'Azure Compute Gallery for my organization'	
   
##Creation of image 
   $imageDefinition = New-AzGalleryImageDefinition `
   -GalleryName $gallery.Name `
   -ResourceGroupName $gallery.ResourceGroupName `
   -Location $gallery.Location `
   -Name 'myImageDefinition' `
   -OsState specialized `
   -OsType Windows `
   -Publisher 'myPublisher' `
   -Offer 'myOffer' `
   -Sku 'mySKU'




#    # Commands used for the install/uninstall

# ## Chrome 
# Download https://chromeenterprise.google/browser/download/#windows-tab

# Silent Install:
# move .\\Chrome .\\googlechromestandaloneenterprise64.msi & start /wait %windir%\\system32\\msiexec.exe /i googlechromestandaloneenterprise64.msi /qn /L*V "C:\Install_Test"

# Chrome Uninstall:
# MsiExec.exe /X {B24F0A95-6C38-3CA4-AFC8-7BDD38B8C51D} /qn
