
$ADAuthorityURL = "https://login.microsoftonline.com/organizations/axiomio"
$resourceURL = "https://AQAEducation.onmicrosoft.com/<<AppRegistrion(1)>>"
$AADuserName = "mahendarreddy.c@axiomio.com"
$AADpassword = "7075873342Ma@" |  ConvertTo-SecureString -Force -AsPlainText
$AADClientID="a418ab71-d84e-4f09-9b1a-955ada1f22f5"
Write-Host "Retrieving the AAD Credentials...";

$credential = New-Object UserPasswordCredential($AADuserName, $AADpassword);
$authenticationContext = New-Object AuthenticationContext($ADAuthorityURL);
$authenticationResult = [AuthenticationContextIntegratedAuthExtensions]::AcquireTokenAsync($authenticationContext, $resourceURL, $AADClientID, $credential).Result;

$authenticationResult.AccessToken


