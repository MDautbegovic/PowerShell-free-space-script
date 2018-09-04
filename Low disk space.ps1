$computer = $env:COMPUTERNAME
$drive = Get-PSDrive c  #Custom drive letter
$drive_GB = [math]::Round($drive.Free / 1GB)
$path = 'C:\CrashDumps' #Setup path that you want to delete
$diskSpaceMinimum = 30  #Setup minimum disk space in this case it is 30GB
if($drive_GB -le $diskSpaceMinimum){
cd $path
rmdir *
$postDelete = [math]::Round($drive.Free / 1GB)
Send-MailMessage -To "user@domain.com" -From "user@domain.com" -Subject "Low disk space on $computer " -Body "Disk space on $computer is $drive_GB (GB) and we delete some files in $path , so  disk space now is $postDelete (GB) " -SmtpServer smtp.domain.com

}