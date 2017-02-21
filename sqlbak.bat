@echo off
 
::Create a loop
 
:loop
 
::Check and Create a folder sqlbak in C:\sqlbak
 
if not exist C:\sqlbak mkdir C:\sqlbak
 
::Setting the sqlbak__Timestamp
 
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /format:list') do set datetime=%%I
set datetime=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2%_%datetime:~8,2%-%datetime:~10,2%-%datetime:~12,2%
 
 
 
::Main backup command goes here. If your user do not have any password then remove -p<password>
 
C:\xampp\mysql\bin\mysqldump.exe -u<Username> -p<Password> <DatabaseName> > C:\sqlbak\sqlbak__%datetime%.sql
 
echo <DatabaseName> database has been Backed up on %datetime%
 
 
:: sleep for 30 minutes and loop over
 
timeout /t 1800
goto loop
