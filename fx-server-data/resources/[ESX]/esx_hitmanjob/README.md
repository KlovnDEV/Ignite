# esx_hitmanjob
FXServer ESX Hitman Job

[REQUIREMENTS]

* Auto mode
  * esx_billing => https://github.com/FXServer-ESX/fxserver-esx_billing

* Player management (boss actions and armory with buyable weapons)
  * esx_society => https://github.com/FXServer-ESX/fxserver-esx_society
  * esx_datastore => https://github.com/FXServer-ESX/fxserver-esx_datastore
  
* ESX Identity Support
  * esx_identity => https://github.com/ArkSeyonet/fxserver-esx_identity

[INSTALLATION]

1) CD in your resources/[esx] folder
2) Clone the repository
```
git clone https://github.com/BeyondEarthRP/esx_hitmanjob
```
3) Import esx_hitmanjob.sql in your database

4) Add this in your server.cfg :

```
start esx_hitmanjob
```


-----
THIS WAS JUST A REPACKING OF: https://github.com/MikeyJY/esx_hitman
I'VE DONE NOTHING TO THIS OTHER THAN REORGANIZE FOR EASIER MANAGMENT.
I DO NOT TAKE ANY CREDIT FOR THIS CODE. (all credit to MikeyJY - TY!)

    BeyondEarthRP CHANGES:
      - Removed nested subdirectory and moved files to root (for easier cloning & management)
      - Renamed this to esx_hitmanjob
