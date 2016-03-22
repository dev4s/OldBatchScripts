::	Tytuà: AutoJoomla.bat
::	Autor: Tomasz Tofel
::	Data utworzenia: 13.05.2010 r.
::	Data wprowadzenia ostatnich poprawek: 26.08.2010 r.
::	Wersja: 0.1.3.2
::	Opis: Skrypt ma za zadanie uàatwiÜ instalacj© na lokalnym serwerze Joomla'i

::	Changelog:
::	* 0.1.3.3
::	- zmieniono òcieæk© dla tmp, logs i adres e-mail
::
::	* 0.1.3.2
::	- zmieniono przedrostek do bazy na kr¢tszy
::
::	* 0.1.3.1
::	- zmieniono folder temporary
::	
::	* 0.1.3
::	- dodano do pliku configuration.php obsàug© strefy czasowej. Ustawiono na "Warszaw©"
::
::	* 0.1.2.1
::	- wyst©pywaày bà©dy przy instalacji moduà¢w gdy byày wpisane òcieæki bezwzgl©dne w 
::	  pliku konfiguracyjnym: configuration.php.
::
::	* 0.1.2
::	- skrypt nie zatrzymywaà si© na ekranie bà©du
::
::	* 0.1.1
::	- poprawiono wyòwietlanie napis¢w
::
::	* 0.1
::	- wersja podstawowa
::

@echo off
setlocal
:: Zmienne lokalne
set u=root
set p=zaq12wsx
set b=tt_
set www=d:\xampp\htdocs\
set wwwj=%www%!!
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
%mrexec% "show databases" > %tfile%
if errorlevel 1 goto error_nodbser
if errorlevel 0 goto start

:start
echo Skrypt dodaje na poczatku nazwy bazy: "%b%". 
echo Ma to na celu ulatwienie i zautomatyzowanie pozniejszego kopiowania 
echo danych na serwer.
echo Baza danych moze miec dlugosc maksymalnie 16 znakow (razem z "%b%"). 
echo Ograniczenie zwiazane z nazwa uzytkownika.
echo Wpisz "exit" (bez znaku ") by wyjsc.

:next
set /p n=Nazwa bazy do utworzenia: 
if "%n%" == "" goto exit
if "%n%" == "exit" goto exit
if "%n%" == "EXIT" goto exit

set udb=%b%%n%
call :change_p udb
:: sprawdza czy napis nie jest dluzszy niz 16 znakow
if not "%udb:~16,1%" == "" goto error_tolong

%mrexec% "show databases" | find "%udb%" > %tfile%
if errorlevel 1 goto all
if errorlevel 0 goto error_badname

:all
:: dla tworzonego konta
set mu=%m% -u %udb% --password=%p% -B --silent
set muexec=%mu% -e

:: dla admina - tworzenie bazy, uæytkownika
echo.
echo - Tworzenie bazy danych i uæytkownika
%mrexec% "create database %udb%" > %tfile%
%mrexec% "create user '%udb%'@'localhost' identified by '%p%'" > %tfile%
%mrexec% "grant all privileges on %udb%.* to '%udb%'@'localhost' with grant option" > %tfile%
::%mrexec% "show grants for '%udb%'@'localhost'"
::%mrexec% "show databases"

:: dla uæytkownika - àadowanie danych
::%muexec% "show databases"
%mu% %udb% < %dbfile%

:: configuration.php dodawanie informacji
echo - Tworzenie pliku konfiguracyjnego Joomla'i
cmd /c echo f | xcopy /y /q %efile% %cfile% > %tfile%
echo. >> %cfile%
echo. >> %cfile%
echo var $log_path = 'D:\\xampp\\_joomla\\logs'; >> %cfile%
echo var $tmp_path = 'D:\\xampp\\_joomla\\tmp'; >> %cfile%
echo. >> %cfile%
echo var $sitename = '%n%'; >> %cfile%
echo. >> %cfile%
echo var $user = '%udb%'; >> %cfile%
echo var $password = '%p%'; >> %cfile%
echo var $db = '%udb%'; >> %cfile%
echo. >> %cfile%
echo var $mailfrom = 'root@localhost.com'; >> %cfile%
echo var $fromname = 'Strona internetowa'; >> %cfile%
echo. >> %cfile%
echo var $MetaKeys = 'joomla'; >> %cfile%
echo var $offset = '1'; >> %cfile%
echo. >> %cfile%
echo ^} >> %cfile%
echo ^?^>>> %cfile%

:: kopiowanie plik¢w
mkdir %www%\%n%
echo - Prosze czekac... trwa kopiowanie...
xcopy /e /h /q /y %wwwj%\*.* %www%\%n% > %tfile%
cmd /c echo f | xcopy /y /q %cfile% %www%\%n% > %tfile%
del %cfile%
del %tfile%
echo.
echo Zakonczono tworzenie!
echo.
echo Adres: http://localhost/%n%
echo Haslo admin'a: %p%
echo.

:exit
pause
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