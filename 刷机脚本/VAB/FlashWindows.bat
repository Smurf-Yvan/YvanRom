@echo off

echo.
echo.设备进入Fastboot并连接电脑，若卡在此处请检查设备连接
echo.By Github@xiaowine 感谢酷安相见既是缘
echo.

title By Github@xiaowine [请勿选中窗口，否则卡住活该，卡住按右键或回车或放大缩小窗口恢复]
bin\Windows\fastboot getvar product 2>&1 | findstr /r /c:"^product: *liuqin" || echo.不匹配的设备
bin\Windows\fastboot getvar product 2>&1 | findstr /r /c:"^product: *liuqin" || exit /B 1
if not exist bin\Windows (
   echo.
   echo.未解压！
   echo.
   pause
   exit
)
cls

if exist super.zst (
   echo.By Github@xiaowine 感谢酷安相见既是缘
   echo.正在转换 super.zst
   bin\Windows\zstd.exe -d super.zst -o super.img
   if "%ERRORLEVEL%" neq "0" (
      echo.转换失败！
      pause
      exit
   )
)
cls

echo.
echo.By Github@xiaowine 感谢酷安相见既是缘
set /p WIPE="是否需要清除数据？，非必要不要建议数据(y/n) "
echo.

if /i "%WIPE%" equ "y" (
   bin\Windows\fastboot erase metadata
   bin\Windows\fastboot erase userdata
)
rem
bin\Windows\fastboot flash "abl_ab" "firmware-update/abl.img"
bin\Windows\fastboot flash "aop_ab" "firmware-update/aop.img"
bin\Windows\fastboot flash "aop_config_ab" "firmware-update/aop_config.img"
bin\Windows\fastboot flash "bluetooth_ab" "firmware-update/bluetooth.img"
bin\Windows\fastboot flash "cpucp_ab" "firmware-update/cpucp.img"
bin\Windows\fastboot flash "devcfg_ab" "firmware-update/devcfg.img"
bin\Windows\fastboot flash "dsp_ab" "firmware-update/dsp.img"
bin\Windows\fastboot flash "dtbo_ab" "firmware-update/dtbo.img"
bin\Windows\fastboot flash "featenabler_ab" "firmware-update/featenabler.img"
bin\Windows\fastboot flash "hyp_ab" "firmware-update/hyp.img"
bin\Windows\fastboot flash "imagefv_ab" "firmware-update/imagefv.img"
bin\Windows\fastboot flash "keymaster_ab" "firmware-update/keymaster.img"
bin\Windows\fastboot flash "modem_ab" "firmware-update/modem.img"
bin\Windows\fastboot flash "qupfw_ab" "firmware-update/qupfw.img"
bin\Windows\fastboot flash "recovery_ab" "firmware-update/recovery.img"
bin\Windows\fastboot flash "shrm_ab" "firmware-update/shrm.img"
bin\Windows\fastboot flash "tz_ab" "firmware-update/tz.img"
bin\Windows\fastboot flash "uefi_ab" "firmware-update/uefi.img"
bin\Windows\fastboot flash "uefisecapp_ab" "firmware-update/uefisecapp.img"
bin\Windows\fastboot flash "vbmeta_ab" "firmware-update/vbmeta.img"
bin\Windows\fastboot flash "vbmeta_system_ab" "firmware-update/vbmeta_system.img"
bin\Windows\fastboot flash "vendor_boot_ab" "firmware-update/vendor_boot.img"
bin\Windows\fastboot flash "vm-bootsys_ab" "firmware-update/vm-bootsys.img"
bin\Windows\fastboot flash "xbl_ab" "firmware-update/xbl.img"
bin\Windows\fastboot flash "xbl_config_ab" "firmware-update/xbl_config.img"
bin\Windows\fastboot flash "xbl_ramdump_ab" "firmware-update/xbl_ramdump.img"
bin\Windows\fastboot flash "cust" "firmware-update/cust.img"
bin\Windows\fastboot flash "boot_ab" "boot.img"

echo.
echo.开始刷入super，可能会卡一会，请耐心等待！！！
echo.By Github@xiaowine 感谢酷安相见既是缘
echo.

bin\Windows\fastboot flash "super" "super.img"
bin\Windows\fastboot set_active a
echo.
echo.刷机结束，若未重启请手动重启
echo.By Github@xiaowine 感谢酷安相见既是缘
echo.

bin\Windows\fastboot reboot
pause