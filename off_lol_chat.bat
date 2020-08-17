@echo off

net SESSION 1>nul 2>nul
if %errorlevel% NEQ 0 (
  echo Please run as administrator.
  goto end
)

set server=vn1.chat.si.riotgames.com
:: Server list:
:: BR     br.chat.si.riotgames.com
:: EUNE   eun1.chat.si.riotgames.com
:: EUW    euw1.chat.si.riotgames.com
:: JP     jp1.chat.si.riotgames.com
:: LAN    la1.chat.si.riotgames.com
:: LAS    la2.chat.si.riotgames.com
:: NA     na2.chat.si.riotgames.com
:: OCE    oc1.chat.si.riotgames.com
:: PH     ph1.chat.si.riotgames.com
:: RU     ru1.chat.si.riotgames.com
:: SG     sg1.chat.si.riotgames.com
:: TH     th1.chat.si.riotgames.com
:: TR     tr1.chat.si.riotgames.com
:: TW     tw1.chat.si.riotgames.com
:: VN     vn1.chat.si.riotgames.com

FOR /f "tokens=1,3 delims=: " %%A IN ('ping -n 1 %server%') DO (
  IF %%A==Reply (
    set IP=%%B
  )
)

if [%1]==[] (
  color 4
  netsh advfirewall firewall add rule name="lolchat" dir=out remoteip=%IP% protocol=TCP action=block
  echo You will appear offline on League Client.
) else (
  color A
  netsh advfirewall firewall delete rule name=lolchat
  echo You will appear online on League Client.
)

:end
timeout /t 3
