::	Tytuà: AutoJoomla.bat
::	Autor: Tomasz Tofel
::	Data utworzenia: 13.05.2010 r.
::	Data poprawek: 15.05.2010 r.
::	Opis: Skrypt ma za zadanie uàatwiÜ instalacj© na lokalnym serwerze Joomla'i

@echo off
setlocal
:: Zmienne lokalne
set u=root
set p=zaq12wsx
set b=baretty7_
set www=d:\xampp\htdocs
set wwwj=%www%\!!
set mp=d:\xampp\mysql\bin\
set m=%mp%mysql.exe
set dbfile=database.sql
set efile=emptyconf.txt
set cfile=configuration.php
set tfile=temp.txt

:: dla admina
set mr=%m% -u %u% --password=%p% -B --silent
set mrexec=%mr% -e

title AutoJoomla Installer
cls

:: sprawdzenie czy MySQL jest uruchomiony
%mrexec% "show databases" > temp.txt
if errorlevel 1 goto error_nodbser
if errorlevel 0 goto start

:start
echo Skrypt dodaje na poczatku nazwy bazy: "%b%". 
echo Ma to na celu ulatwienie i zautomatyzowanie pozniejszego kopiowania danych na serwer.
echo Baza danych moze miec dlugosc maksymalnie 16 znakow (razem z "%b%"). 
echo Ograniczenie zwiazane z nazwa uzytkownika.
echo Wpisz "exit" (bez znaku ") by wyjsc.

set /p s=Nazwa strony: 
if "%s%" == "" goto exit
if "%s%" == "exit" goto exit
if "%s%" == "EXIT" goto exit

set fort=tokens= 1, 2, 3, 4, 5, 6, 7, 8, 9
for /f "%fort% delims= " %%a in ("%s%") do set d1=%%a&set d2=%%b&set d3=%%c&set d4=%%d&set d5=%%e&set d6=%%f&set d7=%%g&set d8=%%h&set d9=%%i
if "%d2%" == "" goto next
:choice
echo Wybierz nazwe folderu docelowego dla Joomla'i:
if not "%d1%" == "" echo 	1. %d1%
if not "%d2%" == "" echo 	2. %d2%
if not "%d3%" == "" echo 	3. %d3%
if not "%d4%" == "" echo 	4. %d4%
if not "%d5%" == "" echo 	5. %d5%
if not "%d6%" == "" echo 	6. %d6%
if not "%d7%" == "" echo 	7. %d7%
if not "%d8%" == "" echo 	8. %d8%
if not "%d9%" == "" echo 	9. %d9%
choice /c 123456789 /n /m ? 
goto dname%errorlevel%

:next
call :change_p dname
set /p n=Nazwa bazy do utworzenia: 
if "%n%" == "" goto exit
if "%n%" == "exit" goto exit
if "%n%" == "EXIT" goto exit

set udb=%b%%n%
call :change_p udb
:: sprawdza czy napis nie jest dluzszy niz 16 znakow
if not "%udb:~16,1%" == "" goto error_tolong

%mrexec% "show databases" | find "%udb%"
if errorlevel 1 goto all
if errorlevel 0 goto error_badname

:all
:: dla tworzonego konta
set mu=%m% -u %udb% --password=%p% -B -t
set muexec=%mu% -e

:: dla admina - tworzenie bazy, uæytkownika
%mrexec% "create database %udb%"
%mrexec% "create user '%udb%'@'localhost' identified by '%p%'"
%mrexec% "grant all privileges on %udb%.* to '%udb%'@'localhost' with grant option"
::%mrexec% "show grants for '%udb%'@'localhost'"
::%mrexec% "show databases"

:: dla uæytkownika - àadowanie danych
%muexec% "show databases"
%mu% %udb% < %dbfile%

:: configuration.php dodawanie informacji
cmd /c echo f | xcopy /y /q %efile% %cfile%
echo. >> %cfile%
echo. >> %cfile%
echo var $log_path = '\\logs'; >> %cfile%
echo var $tmp_path = '\\tmp'; >> %cfile%
echo. >> %cfile%
echo var $sitename = '%s%'; >> %cfile%
echo. >> %cfile%
echo var $user = '%udb%'; >> %cfile%
echo var $password = '%p%'; >> %cfile%
echo var $db = '%udb%'; >> %cfile%
echo. >> %cfile%
echo var $mailfrom = 'www@www.pl'; >> %cfile%
echo var $fromname = 'Strona internetowa'; >> %cfile%
echo. >> %cfile%
echo var $MetaKeys = 'joomla'; >> %cfile%
echo. >> %cfile%
echo ^} >> %cfile%
echo ^?^>>> %cfile%

:: kopiowanie plik¢w
mkdir %www%\%dname%
echo Prosze czekac... trwa kopiowanie...
xcopy /e /h /q /y %wwwj%\*.* %www%\%dname%
cmd /c echo f | xcopy /y /q %cfile% %www%\%dname%
del %cfile%
echo Zakonczono tworzenie!
echo.
echo Adres: http://localhost/%dname%
echo Haslo admin'a: %p%
echo.
pause

:exit
endlocal
exit /b

:: funkcje
:change_p
:: zmodyfikowana wersja
FOR %%i IN ("A=a" "B=b" "C=c" "D=d" "E=e" "F=f" "G=g" "H=h" "I=i"
			"J=j" "K=k" "L=l" "M=m" "N=n" "O=o" "P=p" "Q=q" "R=r"
			"S=s" "T=t" "U=u" "V=v" "W=w" "X=x" "Y=y" "Z=z"
			"§=a" "•=a" "Ü=c" "è=c" "®=e" "©=e" "à=l" "ù=l" "‰=n" 
			"„=n" "¢=o" "‡=o" "ò=s" "ó=s" "æ=z" "Ω=z" "´=z" "ç=z") DO CALL SET "%1=%%%1:%%~i%%"
goto:eof

:: obsàuga bà©d¢w
:error_badname
cls
echo.
echo Baza %n% (%udb%) juz istnieje!
echo.
goto start

:error_tolong
cls
echo.
echo Nazwa bazy jest za dluga!
echo.
goto start

:error_nodbser
cls
echo.
echo MySQL serwer nie jest uruchomiony!
echo.
goto exit

:error_badchoice
::cls
echo.
echo Zly wybor! Sprobuj jeszcze raz!
echo.
goto choice

:dname1
if "%d1%" == "" goto error_badchoice
set dname=%d1% & goto next
:dname2
if "%d2%" == "" goto error_badchoice
set dname=%d2% & goto next
:dname3
if "%d3%" == "" goto error_badchoice
set dname=%d3% & goto next
:dname4
if "%d4%" == "" goto error_badchoice
set dname=%d4% & goto next
:dname5
if "%d5%" == "" goto error_badchoice
set dname=%d5% & goto next
:dname6
if "%d6%" == "" goto error_badchoice
set dname=%d6% & goto next
:dname7
if "%d7%" == "" goto error_badchoice
set dname=%d7% & goto next
:dname8
if "%d8%" == "" goto error_badchoice
set dname=%d8% & goto next
:dname9
if "%d9%" == "" goto error_badchoice
set dname=%d9% & goto next