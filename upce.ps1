

[string]$AccountName = 'Jan'

[int]$PersonalID = 999

[bool]$SpecificNeeds = $true

[double]$Amount = 2.99


$AccountName | Get-Member
$PersonalID | Get-Member

$AccountName.GetType()
$Amount.GetType()
$SpecificNeeds.GetType()







[int]$InputVar2 = Read-Host -Prompt 'Zadej cislo'

'89' + '5'
89 + 5





$OutlookProcess = Get-Process -Name OUTLOOK
$OutlookProcess.GetType()

[System.Diagnostics.Process]$OutlookProcess = Get-Process -Name OUTLOOK
$OutlookProcess.GetType()









if () {}

if () {} else {}

if () {} elseif () {}

if () {} elseif () {} else {}



$color = 'blue'
if ($color -eq 'red') {
    Write-Host 'red' -ForegroundColor red
} elseif ($color -eq 'blue') {
    Write-Host 'blue' -ForegroundColor blue
} else {
    Write-Host 'its neither red nor blue' -ForegroundColor white
}



$color = 'black'
switch ($color) {
    'blue' {Write-Host 'blue' -ForegroundColor blue}
    'red' {Write-Host 'red' -ForegroundColor red}
    'yellow' {Write-Host 'yellow' -ForegroundColor yellow}
    default {Write-Host 'its neither red nor blue nor yellow' -ForegroundColor white}
}




$color = 'yellow'
switch -Wildcard ($color) {
    'blue' {Write-Host 'blue' -ForegroundColor blue}
    'red' {Write-Host 'red' -ForegroundColor red}
    'yel*' {Write-Host 'yellow' -ForegroundColor yellow}
    default {Write-Host 'its neither red nor blue nor yellow' -ForegroundColor white}
}




[string]$FirstName = 'Jan'
[string]$Text =  'Current name is $FirstName'
Write-Host $Text



[string]$FirstName = 'Jan'
[string]$Text =  "Current name is $FirstName"
Write-Host $Text



[string]$FirstName = 'Jan'
[string]$Text =  "Current name is $FirstName and current email is jan@cyber-rangers.com"
Write-Host $Text



[string]$FirstName = 'Jan'
[string]$Text =  "Current name is $FirstName and current price is $100 "
Write-Host $Text







[string]$FirstName = 'Jan'
[string]$Text =  "Current name is $FirstName and current price is `$100 "
Write-Host $Text



Get-Process | Select-Object `
 -Property `
Name,Id,VM,PagedMemorySize `
 | Sort-Object `
 -Property `
 Name | `
 ConvertTo-Csv





 [string]$FirstName = 'Jan'
[string]$Text =  "Current name is $FirstName and current price is `$100 "
[string]$Text =  'Current name is {0} and current price is {1}' -f $FirstName,'$100'
Write-Host $Text





for ($number = 0; $number -lt 99; $number = $number + 2) {
    Write-Host "Number is $number"
}

for ($number = 0; $number -lt 99; $number = $number + 1) {
    Write-Host "Number is $number"
}

for ($number = 0; $number -lt 99; $number++) {
    Write-Host "Number is $number"
}

for ($number = 99; $number -gt 20; $number--) {
    Write-Host "Number is $number"
}


$processes = Get-Process

for ($index = 0; $index -lt $processes.count; $index++) {
    $processes[$index]
}




Get-Process | ForEach-Object {
    if ($_.ProcessName -like "o*o*") {
        $_.ProcessName
    }
}

Get-Process | ForEach-Object {
    if ($PSItem.ProcessName -like "o*o*") {
        $PSItem.ProcessName
    }
}

$processes = Get-Process
foreach ($process in $processes) {
    if ($process.ProcessName -like "o*o*") {
        $process.ProcessName
    }
}


$number = 99
while ($number -lt 99) {
    $number
    $number++
}


$number = 99
do {
    $number
    $number++
} while ($number -lt 99)




$number = 1
do {
    $number
    $number++
} until ($number -lt 99)








#toto je hlavni cast kodu
<#
toto je 
vice
radkovy
komentar
#>
$MenuSelections = 'List Processes','List Services','Hello World','Quit'
do {
    #region Tady je vnitrek cyklu DO
    $Selection = $MenuSelections | Out-GridView -PassThru
    switch ($Selection) {
        'List Processes' {Get-Process}
        'List Services' {Get-Service}
        'Hello World' {Write-Host 'Hello World' -ForegroundColor Yellow}
    }
    #endregion Tady je vnitrek cyklu DO
} until ($Selection -eq 'Quit')





function Invoke-Menu {
    $MenuSelections = 'List Processes','List Services','Hello World','Quit'
    do {
        $Selection = $MenuSelections | Out-GridView -PassThru
        switch ($Selection) {
            'List Processes' {Get-Process}
            'List Services' {Get-Service}
            'Hello World' {Write-Host 'Hello World' -ForegroundColor Yellow}
        }
    } until ($Selection -eq 'Quit')   
}

Invoke-Menu





function Invoke-Menu2 {
    param(
        [bool]$ClearAfterEachStep
    )

    $MenuSelections = 'List Processes','List Services','Hello World','Quit'
    do {
        $Selection = $MenuSelections | Out-GridView -PassThru
        switch ($Selection) {
            'List Processes' {Get-Process}
            'List Services' {Get-Service}
            'Hello World' {Write-Host 'Hello World' -ForegroundColor Yellow}
        }
        if ($ClearAfterEachStep -eq $true) {
            Clear-Host
        }
    } until ($Selection -eq 'Quit')   
}


Invoke-Menu2
Invoke-Menu2 -ClearAfterEachStep $true







function Invoke-Menu3 {
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


Invoke-Menu3
Invoke-Menu3 -ClearAfterEachStep














#funkci ulozit do psm1 souboru
Import-Module C:\temp\UPCEModule\UPCEModule.psm1
Get-Module
Get-Command -Module UPCEModule
Invoke-UPCEModule -ClearAfterEachStep










Get-WmiObject -Class win32_bios -EnableAllPrivileges
Show-Command Get-WmiObject










Get-Process | Format-Table -AutoSize -Wrap
Get-Process | Format-List
Get-Process | Format-Wide
Get-Process | Format-Custom #slozitejsi