function Invoke-UPCEMenu {
    param(
        [switch]$ClearAfterEachStep
    )

    $MenuSelections = 'List Processes','List Services','Hello World','Quit'
    do {
        $Selection = $MenuSelections | Out-GridView -PassThru
        switch ($Selection) {
            'List Processes' {Get-Process}
            'List Services' {Get-Service}
            'Hello World' {Write-Host 'Hello World' -ForegroundColor Yellow}
        }
        if ($ClearAfterEachStep.ispresent -eq $true) {
            Clear-Host
        }
    } until ($Selection -eq 'Quit')   
}