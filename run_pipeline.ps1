# Running pipeline using rest apis and powershell
# base url :- https://dev.azure.com/{organization}/{project}/_apis/build/builds?definitionId={build_defination_id}&api-version=6.1-preview.6

$user = "mahendarreddy.c"
$token = "q4kpl6zrcw2aqm4la3x2hhsaohzsilkaw3g4jkttfkjdocusstea"

$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $user,$token)))

$org = "mahendarreddyc0563"
$teamProject = "task_1"
$defId = "8"

$restApiRunBuild = "https://dev.azure.com/$org/$teamProject/_apis/build/builds?definitionId=$defId&api-version=6.1-preview.6"


function InvokePostReques ($PostUrl, $body)
{   
    return Invoke-RestMethod -Uri $PostUrl -Method Post -ContentType "application/json" -Headers @{Authorization=("Basic {0}" -f $base64AuthInfo)}  -Body $body
}

$result = InvokePostReques $restApiRunBuild ""

$result