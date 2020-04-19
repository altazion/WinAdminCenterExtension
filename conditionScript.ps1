$response = @{
    State = 'NotSupported';
    Message = 'Not executed';
    Properties = @{ Name = 'HasMultipleAltazionConfig'; Value = $false; Type = 'boolean' },
        @{ Name = 'KoostodesServiceName'; Value = ''; Type = 'string' };
};

$folder = Get-Item $Env:PROGRAMDATA'\Cpoint\``[e``]' -ErrorAction SilentlyContinue;

if($folder -ne $null) {
    $parent = $folder.Parent; 
    $multi = Get-Content ($parent.FullName + '\current.config') -ErrorAction SilentlyContinue
    if($multi -ne $null) { $response.Properties[0].Value = $true; }
    $svc = Get-Service emainsrv -ErrorAction SilentlyContinue;
    if($svc -eq $null) {
        $svc = Get-Service altazionkoostodes -ErrorAction SilentlyContinue;
    }
    if($svc -ne $null) {
        $response.Properties[0].Value = $svc.Name;
    }
    $response.State = 'Available';
    $response.Message = 'Dossier trouvé.';
};

$response