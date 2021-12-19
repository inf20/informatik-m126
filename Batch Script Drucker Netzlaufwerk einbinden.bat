@echo off
cls

rem	Datei:Stutz_LA_126_1013_Scripting_Drucker_Netzwerkspeicher
rem	Datum:2021-12-18
rem	Ersteller:Stutz Jan (IN20c)
rem	Version:1.0.0
rem	Änderungen:Script erstellt, Abgabe erfolgt.
rem	Beschreibung:
rem	Dieses Powershell Script dient zur Einbindung eines Netzwerkdruckers und einem Netzlaufwerkes.

echo                                                           ....``                                   
echo                                                           :   `.--------...``                      
echo                                                           :           `````..----:                 
echo                                                          -`                     `/                 
echo                                                         `-                      :-                 
echo                                                        -:`                      +                  
echo                                                       ..-                      .:```               
echo                                                      `.:                      `/``.+               
echo                                                      .:`                      /`  +.               
echo                                                     .-.                      .-  -+                
echo                                                 ```.--                      `/  `o`                
echo                                  ```````````..--//+/:                       :`  /-                 
echo                             ``...`..-://++ohddmNNhyy`                      --  .+                  
echo                         `..`..`-/::-. `:+shmNNNMMMN.                      `/`` o`                  
echo                     `.`````-+/:.`           `.-:+o/..`                    oyo..//                  
echo                    `-   .`   `````....`     `..-osyo-.--```....`       `--/-.:sds`                 
echo                    -   -              `....::--:++++:-.`       `.........::+/    `../:             
echo                    -  `:..`                    `.--/----.`             .---`    ./syyy`            
echo                    -  `. `........`                     `-----::-.`.---`    -+yyhsss-o`            
echo                    -  `-          `........`                    `-+.   `-+syysydmms` +`            
echo                    -   -                   ...-.....            --    +dsoyhdmMMMo   o`            
echo                    -   -                           `.---....`  `/    /d+yNMNmmMMh`   o`            
echo                    -   -  o+:-.                           ``.--/-    d/sNMMMMMMN.    o`            
echo                    -   -  NMMmddhs/::-`                        -.    M/yMMMMMMM/     o`            
echo                    ..``-  NMMdhy/.``..:///::-.`                -.    M/hNNNNNNy      o`            
echo                    ..``...yNys-`         ``..-:///::-.`        -.    M/hmmNmmd.      s`            
echo                    -    `smm:`                   `..-:/oso/.   -.   `M/hmmNmm/     .+o             
echo                    ..```/my.                        .-oydmN+   -.    M/dmmNmh`  .:s+-`             
echo                   ```..`:/`                        ::```.-//   -.    M/NMMMh../yddo`               
echo                  -.`  `:.                         ods+:-.` :   -.    M/MMNh+ydds:`                 
echo                  `..-:-`                        `:+shmmNms:/.``-:    M/MMNmmy:`                    
echo               ```....                          `:`   `.:+`   ``.:...`mmMNh/.                       
echo              `-::-```                         `:`       :.``       `/hh+.                          
echo                  .-://:-.``                  -:`       `-//:/+/:--/s+-                             
echo                       `.::://-.``          `::....````--.`    `...`                                
echo                              .-::/::.```.::-`    ``````                                            
echo                                    `-----`                                                         


rem     Um Script benutzerfreundlicher zu gestalten, kann er hier seinen Benutzernamen bzw. Namen eingeben. Damit er im nächsten Teil auch ein Beispiel sieht, wie es aussehen würde,
rem     wenn er sich mit diesem Benutzernamen an der BBBaden.local Domain einloggen will.
            set /p NAME=Herzlich willkommen zu diesem Script zur Druckereinbindung und Netzlaufwerkeinbindung. Wie darf ich sie nennen?


rem     Hier werden die Credentials festgelegt, mit denen sich der Benutzer einloggt. 
            set /p DOMAINUSERNAME=Bitte geben sie Ihren Benutzernamen inkl. Domain an Beispiel: (bbbaden.local\%NAME%):
            set /p PASS=Bitte geben sie Ihr Kennwort zum Benutzer %DOMAINUSERNAME% ein:


rem     In diesem Teil des Skriptes wird der Ordner und das Netzlaufwerk ausgewöhlt und die Credentials mitgegeben. 
            cmdkey.exe /add:bbbaden.local /user:%DOMAINUSERNAME% /pass:%PASS%
            cmdkey.exe /add:print.bbbaden.local /user:%DOMAINUSERNAME% /pass:%PASS%


rem     Hier wird der Drucker eingebunden
rem     Da es mir zeitlich nicht ganz gereicht hat, konnte ich der untere Teil des Scriptes leider nicht mehr im BBBaden Netzwerk ausführen.
rem     Der Drucker wird eingebunden und das Netzlaufwerk. Netzlaufwerk hat den Buchstaben b.
            rundll32 printui.dll PrintUIEntry /in /n "\\print.bbbaden.local\"\
            net use b: \\bbbaden.local\public\info /persistent:yes
echo.
