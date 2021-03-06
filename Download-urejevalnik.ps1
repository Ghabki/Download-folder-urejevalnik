﻿Write-Output "Ghabkijev urejevalnik"
Write-Output ""

$name = Read-Host "Si preprican da zelis urediti Download mapo  (Y/N)"

if ($name -ne "y"){
    Write-Output "Program se bo zaustavil"
    Start-Sleep -Seconds 1.3
    exit
}


$lokacija = Get-Location
$ime = $env:UserName

$CelotnaLokacija = "C:\Users\" + $ime + "\Downloads"

if($lokacija -ne $CelotnaLokacija){
    Set-Location $CelotnaLokacija
    Write-Output "Zdej si v tvoji download mapi (ta mapa je prava samo ce nisi spreminjal default mape)"
}
Write-Output . . . .


# lahko bi uporabu array in z zanko šel čez, ma itak je vseeno pac malo vec kode


if (Test-Path "Video") {
    Write-Output "Video......Ok"
}else{
    Write-Output "Video......X"
    Write-Output "Creating Video folder....."
    New-Item Video -ItemType Directory
    Write-Output "Video......Ok"
}

if (Test-Path "Torrent") {
    Write-Output "Torrent......Ok"
}else{
    Write-Output "Torrent......X"
    Write-Output "Creating Torrent folder....."
    New-Item Torrent -ItemType Directory
    Write-Output "Torrent......Ok"
}

if (Test-Path "Exe") {
    Write-Output "Exe......Ok"
}else{
    Write-Output "Exe......X"
    Write-Output "Creating Exe folder....."
    New-Item Exe -ItemType Directory
    Write-Output "Exe......Ok"
}

if (Test-Path "Slike") {
    Write-Output "Slike......Ok"
}else{
    Write-Output "Slike......X"
    Write-Output "Creating Slike folder....."
    New-Item Slike -ItemType Directory
    Write-Output "Slike......Ok"
}

if (Test-Path "Dokumenti") {
    Write-Output "Dokumenti......Ok"
}else{
    Write-Output "Dokumenti......X"
    Write-Output "Creating Dokumenti folder....."
    New-Item Dokumenti -ItemType Directory
    Write-Output "Dokumenti......Ok"
}

if (Test-Path "Ostalo") {
    Write-Output "Ostalo......Ok"
}else{
    Write-Output "Ostalo......X"
    Write-Output "Creating Ostalo folder....."
    New-Item Ostalo -ItemType Directory
    Write-Output "Ostalo......Ok"
}

<#
if (Test-Path "15Min") {
    Write-Output "15Min......Ok"
}else{
    Write-Output "15Min......X"
    Write-Output "Creating 15Min folder....."
    New-Item 15Min -ItemType Directory
    Write-Output "15Min......Ok"
}#>

Write-Output . . . .


$Video_koncnice = "webm", "mkv", "flv", "vob", "ogg", "ogv", "avi", "mov", "mp4", "mpg", "m4v", "flv"
$Torrent_koncnice = "torrent"
$Exe_koncnice = "exe", "msi", "apk", "bat", "reg", "jar"
$Slike_koncnice = "png", "jpg", "jpeg", "gif", "eps", "ai", "ttif", "psd", "indd", "raw", "ico", "svg", "ps"
$Dokumenti_koncnice = "pdf", "docx", "doc", "html", "odt", "xls", "xlsx", "ods", "ppt", "pptx", "txt", "csv", "log", "sql", "py", "epub", "java"
$Ostalo_koncnice = "zip", "rar", "gz","R", "tgz", "vsix", "mp3", "wav", "flac", "diagcab", "iso"

$Video_folder = $CelotnaLokacija + "\Video"
$Torrent_folder = $CelotnaLokacija + "\Torrent"
$Exe_folder = $CelotnaLokacija + "\Exe"
$Slike_folder = $CelotnaLokacija + "\Slike"
$Dokumenti_folder = $CelotnaLokacija + "\Dokumenti"
$Ostalo_folder = $CelotnaLokacija + "\Ostalo"

$count = 0




foreach ($element in $Video_koncnice) {
    $urejena_koncnica = ".\*." + $element

    try {
        Get-ChildItem -Path $urejena_koncnica -Recurse | Move-Item -Destination $Video_folder -ErrorAction Stop<# Eroraction pomeni kaj naj naredi ko se zgodi napaka(npr. stop je stop, coninue je da nadaljuje izvajanje)#>
        <#tukaj se mi zdi da se lahko odstrani -recurse. to nekako naredi da gre spet v subfolderje gledat da premakne stvari kar pa ne zelimo (nisem se preveril)#>
        <# ter lahko se naredim ce je slucajno folder v tej mapi naj napise da je skipalo te folderje #>
    }
    catch {
        $count = $count+1
        Write-Output "File ni bil premaknjen"
    }

}

foreach ($element in $Torrent_koncnice) {
    $urejena_koncnica = ".\*." + $element

    try {
        Get-ChildItem -Path $urejena_koncnica -Recurse | Move-Item -Destination $Torrent_folder -ErrorAction Stop
    }
    catch {
        $count = $count+1
        Write-Output "File ni bil premaknjen"        
    }
}

foreach ($element in $Exe_koncnice) {
    $urejena_koncnica = ".\*." + $element

    try {
        Get-ChildItem -Path $urejena_koncnica -Recurse | Move-Item -Destination $Exe_folder -ErrorAction Stop
    }
    catch {
        $count = $count+1
        Write-Output "File ni bil premaknjen"
    }
}

foreach ($element in $Slike_koncnice) {
    $urejena_koncnica = ".\*." + $element

    try {
        Get-ChildItem -Path $urejena_koncnica -Recurse | Move-Item -Destination $Slike_folder -ErrorAction Stop
    }
    catch {
        $count = $count+1
        Write-Output "File ni bil premaknjen"
    }
}

foreach ($element in $Dokumenti_koncnice) {
    $urejena_koncnica = ".\*." + $element

    try {
        Get-ChildItem -Path $urejena_koncnica -Recurse | Move-Item -Destination $Dokumenti_folder -ErrorAction Stop
    }
    catch  {
        $count = $count+1
        Write-Output "File ni bil premaknjen"    
    }
}

foreach ($element in $Ostalo_koncnice) {
    $urejena_koncnica = ".\*." + $element

    try {
        Get-ChildItem -Path $urejena_koncnica -Recurse | Move-Item -Destination $Ostalo_folder -ErrorAction Stop

    }
    catch {
        $count = $count+1
        Write-Output "File ni bil premaknjen"    
    }
}

Write-Output "Koncano"

Write-Output "Števlilo datotek ki se ni premaknilo  >> " $count "(ali obstaja istoimenski duplikat, v tem primeru se mora preimenovati file ------ ali pa je nastal drugacen error)"


