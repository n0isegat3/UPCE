<#

Windows PowerShell 5.1 (2,3,5)
- Windows 7 - 2.0
- Windows 8 - 3.0
- windows 10 - 5.0

PowerShell 7

SAPIEN PowerShell Studio

#>



$pole1 = 1,4,6,8
$pole2 = @()
$pole1.count
$pole2.count
$pole2 | Measure-Object | Select-Object -ExpandProperty Count

if ($pole2.count -eq 0) {
    'tohle ve powershell 2 nebude fungovat'
}



Set-AuthenticodeSignature -Certificate C:\test.pfx -FilePath .\test.ps1 -TimestampServer http://neco


powershell.exe -ExEc bypass


# POZOR ALE NA CONSTRAINED LANGUAGE MODE
Write-Host 'ahoj'
[system.console]::WriteLine('ahoj')
[math]::round(1.543634)



#POZOR NA AMSI
function Invoke-Mimikatz {
    'cau'
}





Get-Command -Name *service*
Get-Module -Name Microsoft.PowerShell.Management
$env:PSModulePath

Get-Help -Name Get-Service
Update-Help -Module Microsoft.PowerShell.Management

Get-Service
gsv

Get-ChildItem
dir
ls
gci


New-Alias -Name Dej-Procesy -Value Get-Process
Dej-Procesy

New-Alias -Name Get-Service -Value Stop-Computer
get-help Get-Service

cd env:
ls
cd cert:
ls
cd alias:
ls
cd AD:
ls

New-PSDrive -Name krutak -PSProvider FileSystem -Root C:\Users\janmarek
cd krutak:
cls



Get-Process -Name lsass
Get-Process lsass
get-help Get-Process -full
get-help Get-Process -Parameter name
gps lsass



Get-Process -Verbose
Get-Service spooler | Stop-Service -Verbose
Get-ChildItem -Verbose


[string]$barva = 'cervena'
[int]$cislo = 1
[int]$cislo123 = Read-Host -Prompt 'zadej cislo'
$cislo123.GetType()


if ($barva -eq 'cervena') {
    Write-Host '           ' -BackgroundColor Red
}

'honza' -eq 'HONZA'
'honza' -ceq 'HONZA'
'honza' -like "*ONZ*"
'honza' -clike "*ONZ*"

$b = 3
if ($b -eq 1) {
    Write-Host 'jedna'
} else {
    Write-Host 'neni jedna'
}

if ($b -eq 1) {
    Write-Host 'jedna'
} elseif ($b -eq 2) {
    Write-Host 'dva'
} else {
    Write-Host 'ani jedna ani dva'
}

switch ($b) {
    1 {Write-Host 'jedna'}
    2 {Write-Host 'dva'}
    default {Write-Host 'ani jedna ani dva'}
}

switch -Wildcard ($text) {
    "*arva" {}
    "b*" {}
}

$cisla = 1,4,7,8
foreach ($jednocislo in $cisla) {
    Write-Host ('Cislo je {0}' -f $jednocislo)
    Write-Host ('Cislo je ' + $jednocislo)
    Write-Host "Cislo je $jednocislo"
}


$cisla | ForEach-Object {
    Write-Host ('Cislo je {0}' -f $_)
    Write-Host ('Cislo je {0}' -f $PSItem)

    #$Temp = $_

    $_ | ForEach-Object {
        # CO JE TED TADY V $_ ????
    }
}



#troubleshooting level LAMA
$hodnota = 1
Write-Host "V `$hodnota je $hodnota"

Write-Host "Jedna radka a `nTohle uz je na nove radce"
Write-Host "Tohle je normalka"
Write-Host "`tTohle je odsazene"


$poleTextu = @()
$poleTextu = 'ahoj','text'
$poleTextu

1..100 | ForEach-Object {
    $poleTextu += 'znovu'
}

$poleTextu




$poleLepsi = New-Object System.Collections.ArrayList
$poleLepsi.Add('ahoj')
$poleLepsi.Add('text')
1..100 | ForEach-Object {
    $poleTextu.Add('znovu')
}




for ($i = 0; $i -le 9; $i++) {
    write-host $i
}

for ($i = 1; $i -le 9; $i = $i + 2) {
    write-host $i
}


$i = 5
$i > 5
$i < 5


Write-Host 'text'
$text = 'text'
Write-Host $text

function Napis-Text ($text) {
    Write-Host $text
}

function Napis-Text {
    param($text)
    Write-Host $text
}

Napis-Text ahoj

Napis-Text -text ahoj



function Napis-Text {
    [cmdletbinding()]
    param(
        [Parameter(Mandatory,HelpMessage='sakra zadej text')]$text,
        $barva = 'white'
        )
    Write-Verbose ('Spusteno v {0}' -f (Get-Date -f 'yyyy-MM-dd HH:mm:ss:fff'))
    Write-Host $text -ForegroundColor $barva
}

Napis-Text -text test -Verbose

Get-Command Napis-Text

# NACIST SI ADVANCED PARAMETERS
