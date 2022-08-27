function GetUrl() {
    param(
        [string]$orgUrl, 
        [hashtable]$header, 
        [string]$AreaId
    )

    # Area ids
    # https://docs.microsoft.com/en-us/azure/devops/extend/develop/work-with-urls?view=azure-devops&tabs=http&viewFallbackFrom=vsts#resource-area-ids-reference
    # Build the URL for calling the org-level Resource Areas REST API for the RM APIs
    $orgResourceAreasUrl = [string]::Format("{0}/_apis/resourceAreas/{1}?api-preview=5.0-preview.1", $orgUrl, $AreaId)

    # Do a GET on this URL (this returns an object with a "locationUrl" field)
    $results = Invoke-RestMethod -Uri $orgResourceAreasUrl -Headers $header

    # The "locationUrl" field reflects the correct base URL for RM REST API calls
    if ("null" -eq $results) {
        $areaUrl = $orgUrl
    }
    else {
        $areaUrl = $results.locationUrl
    }

    return $areaUrl
}
$orgUrl = "https://dev.azure.com/mahendarreddyc0563/"
$personalToken = "q4kpl6zrcw2aqm4la3x2hhsaohzsilkaw3g4jkttfkjdocusstea"

Write-Host "Initialize authentication context" -ForegroundColor Yellow
$token = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(":$($personalToken)"))
$header = @{authorization = "Basic $token"}

# DEMO 1 List of projects
Write-Host "Demo 1"
$coreAreaId = "79134c72-4a58-4b42-976c-04e7115f32bf"
$tfsBaseUrl = GetUrl -orgUrl $orgUrl -header $header -AreaId $coreAreaId
# https://docs.microsoft.com/en-us/rest/api/azure/devops/core/projects/list?view=azure-devops-rest-5.1
$projectsUrl = "$($tfsBaseUrl)_apis/projects?api-version=5.1"

$projects = Invoke-RestMethod -Uri $projectsUrl -Method Get -ContentType "application/json" -Headers $header

$projects.value | ForEach-Object {
    Write-Host $_.name
}

Write-Host "Demo 2"
$projects.value | ForEach-Object {
    $project = $_.name
    $releaseManagementAreaId = "2e0bf237-8973-4ec9-a581-9c3d679d1776"
    $tfsBaseUrl = GetUrl -orgUrl $orgUrl -header $header -AreaId $releaseManagementAreaId

    # GET https://dev.azure.com/{organization}/{project}/_apis/pipelines?api-version=6.0-preview.1
    
    $relDefUrl = "$tfsBaseUrl/$project/_apis/pipelines?api-version=6.0-preview.1"
    $result = Invoke-RestMethod $relDefUrl -Method Get -ContentType "application/json" -Headers $header
    $relDefs = $result.value
    
    if($relDefs.count -gt 0){
        Write-Host "$project $($relDefs.count) pipelinesfounds" -ForegroundColor Blue
        $relDefs | ForEach-Object {
            Write-host "`t$($_.name)" -ForegroundColor Green
        }
    }
}