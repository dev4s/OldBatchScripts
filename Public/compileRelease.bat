@echo off
call "%VS120COMNTOOLS%..\..\VC\vcvarsall.bat" x86
msbuild %1 /p:Configuration=Release
pause