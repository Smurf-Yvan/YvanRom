@echo off
title 线刷脚本 [请勿选中窗口，否则卡住活该，卡住按右键或回车或放大缩小窗口恢复]
echo.若卡在 ^<waiting for any device^> 请自行寻找驱动
bin\Windows\fastboot getvar product 2>&1 | findstr /r /c:"^product: *umi" || echo.不匹配的设备
bin\Windows\fastboot getvar product 2>&1 | findstr /r /c:"^product: *umi" || exit /B 1
:MENU
if not exist bin\Windows (
   echo.
   echo.未解压！
   echo.
   pause
   exit
)
cls

if not exist boot.img (
   echo.
   echo.Boot 文件丢失，终止刷机
   echo.
   pause
   exit
)
if exist super.zst (
   echo.正在转换 super.zst
   bin\Windows\zstd.exe --rm -d super.zst -o super.img
   if "%ERRORLEVEL%" neq "0" (
      echo.转换失败！
      pause
      exit
   )
)
cls
echo.
set /p WIPE="是否需要清除数据？(y/n) "
echo.

rem
bin\Windows\fastboot flash abl "firmware-update/abl.elf"
bin\Windows\fastboot flash ablbak "firmware-update/abl.elf"
bin\Windows\fastboot flash aop "firmware-update/aop.mbn"
bin\Windows\fastboot flash aopbak "firmware-update/aop.mbn"
bin\Windows\fastboot flash bluetooth "firmware-update/BTFM.bin"
bin\Windows\fastboot flash boot "boot.img"
bin\Windows\fastboot flash cmnlib "firmware-update/cmnlib.mbn"
bin\Windows\fastboot flash cmnlibbak "firmware-update/cmnlib.mbn"
bin\Windows\fastboot flash cmnlib64 "firmware-update/cmnlib64.mbn"
bin\Windows\fastboot flash cmnlib64bak "firmware-update/cmnlib64.mbn"
bin\Windows\fastboot flash devcfg "firmware-update/devcfg.mbn"
bin\Windows\fastboot flash devcfgbak "firmware-update/devcfg.mbn"
bin\Windows\fastboot flash dsp "firmware-update/dspso.bin"
bin\Windows\fastboot flash dtbo "firmware-update/dtbo.img"
bin\Windows\fastboot flash featenabler "firmware-update/featenabler.mbn"
bin\Windows\fastboot flash hyp "firmware-update/hyp.mbn"
bin\Windows\fastboot flash hypbak "firmware-update/hyp.mbn"
bin\Windows\fastboot flash keymaster "firmware-update/km4.mbn"
bin\Windows\fastboot flash logo "firmware-update/logo.img"
bin\Windows\fastboot flash modem "firmware-update/NON-HLOS.bin"
bin\Windows\fastboot flash qupfw "firmware-update/qupv3fw.elf"
bin\Windows\fastboot flash qupfwbak "firmware-update/qupv3fw.elf"
bin\Windows\fastboot flash storsec "firmware-update/storsec.mbn"
bin\Windows\fastboot flash storsecbak "firmware-update/storsec.mbn"
bin\Windows\fastboot flash tz "firmware-update/tz.mbn"
bin\Windows\fastboot flash tzbak "firmware-update/tz.mbn"
bin\Windows\fastboot flash uefisecapp "firmware-update/uefi_sec.mbn"
bin\Windows\fastboot flash vbmeta_system "firmware-update/vbmeta_system.img"
bin\Windows\fastboot flash vbmeta "firmware-update/vbmeta.img"
bin\Windows\fastboot flash xbl_4 "firmware-update/xbl_4.elf"
bin\Windows\fastboot flash xbl_5 "firmware-update/xbl_5.elf"
bin\Windows\fastboot flash xbl_config_4 "firmware-update/xbl_config_4.elf"
bin\Windows\fastboot flash xbl_config_5 "firmware-update/xbl_config_5.elf"
if exist super_empty.img bin\Windows\fastboot flash super firmware-update/super_empty.img
if exist super.img bin\Windows\fastboot flash super super.img
echo.刷完super可能会卡一会，请耐心等待！！！

if /i "%WIPE%" equ "y" (
   echo.正在格式化metadata，请耐心等待！！！
   bin\Windows\fastboot erase metadata
   echo.正在格式化userdata，请耐心等待！！！
   bin\Windows\fastboot erase userdata
)
bin\Windows\fastboot reboot
pause