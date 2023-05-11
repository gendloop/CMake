@echo off
set NAME=%~n0

C:\Windows\System32\cmd.exe /k "D:\Web\Nodejs\nodevars.bat" 

powershell.exe -ExecutionPolicy RemoteSigned ./Generate_Tree.ps1