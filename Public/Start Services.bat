@ECHO OFF
net stop w3svc
net stop was

set path=d:\xampp\
%xampp_path%xampp_cli.exe start apache
%xampp_path%xampp_cli.exe start mysql
::%path%xampp_cli.exe start mercury