@echo off
set NAME=%~n0
powershell.exe -ExecutionPolicy RemoteSigned ./%NAME%.ps1

choice /C YN /D Y /N /T 3
