@ECHO OFF
set xampp_path=d:\xampp\
%xampp_path%xampp_cli.exe stop apache
%xampp_path%xampp_cli.exe stop mysql
::%xampp_path%xampp_cli.exe stop mercury

net start was
net start w3svc