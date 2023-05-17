set d=%date:~10,4%%date:~4,2%%date:~7,2%
set t=%time:~0,2%%time:~3,2%%time:~6,2%
MD C:\Temp\chef_%d%%t%
move /y c:\chef\client.rb C:\Temp\chef_%d%%t%
move /y c:\chef\client.pem C:\Temp\chef_%d%%t%
move /y c:\chef\lbusa-validator.pem C:\Temp\chef_%d%%t%