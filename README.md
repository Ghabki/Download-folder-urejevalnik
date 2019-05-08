### Description

It' made for relocating files from download folder to separate folder inside download folder
.
There are 6 folders that will be created (video, torrent, slike, exe, ostalo, dokumenti)
.
You can add the extensions in the code to the desired folder you want to be saved in.
.
.
.

### Extensions and folders used in this script

Video = "webm", "mkv", "flv", "vob", "ogg", "ogv", "avi", "mov", "mp4", "mpg", "m4v", "flv"

Torrent = "torrent"

Exe = "exe", "msi", "apk", "bat", "reg"

Slike = "png", "jpg", "jpeg", "gif", "eps", "ai", "ttif", "psd", "indd", "raw"

Dokumenti = "pdf", "docx", "doc", "html", "odt", "xls", "xlsx", "ods", "ppt", "pptx", "txt"

Ostalo = "zip"

.
.
.

### How to run

1: Run powershell as administrator

2: Write    Set-ExecutionPolicy RemoteSigned   press Enter, then type   A    press enter Enter   (this is needed, because windows needs premission to run the script (you can read more here https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-6)

3: Now in powershell navigate to the script location

4: Write   .\Download-urejevalnik.ps1       press enter



### Notes

  - It's possible that you have the default download folder somewere else (in this case, the script wont work)
  - I haven't tested this script on other computers... (it might not work right)
  - Keep in mind if you alredy have a folder named as the names used in the script, it will put the files in the alredy folder that was there before  
  -Made this becouse i wanted to try powershell
