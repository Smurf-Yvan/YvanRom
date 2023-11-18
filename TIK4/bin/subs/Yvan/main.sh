if [ -f "$project/product/media/bootanimation.zip" ]; then
    # 如果 bootanimation.zip 文件存在，则设置 sr 变量为 project/product
    sr="$project/product"
fi

echo "处理data路径：$sr"
echo "处理毒瘤替换毒瘤文件！"

# 只有当 bootanimation.zip 存在时才进行删除操作
if [ -n "$sr" ]; then
    rm -rf "$sr/app/AnalyticsCore"
    echo "开始精简其他无用APP...."
else
    echo "bootanimation.zip 文件不存在，跳过删除操作。"
fi
echo "精简system/app"
rm -rf $project/vendor/recovery-from-boot.p
# 基本互动屏保
rm -rf $project/system/system/app/BasicDreams
# 相机扩展代理
rm -rf $project/system/system/app/CameraExtensionsProxy
# 运营商默认应用
rm -rf $project/system/system/app/CarrierDefaultApp
# 配套设备管理器 演示机应用
rm -rf $project/system/system/app/CompanionDeviceManager
# GMS包中的Google浏览器Chrome定制书签
rm -rf $project/system/system/app/PartnerBookmarksProvider
# 打印相关
rm -rf $project/system/system/app/PrintRecommendationService
# 主屏幕提示小绿人软件
rm -rf $project/system/system/app/Protips
# Carrier App Dialog 当您开机后，本工具会自动检测您需要下载的应用，并在下拉菜单提示您进行下载并安装，让您得到更加智能和便捷的使用体验。嗯，就是sim卡应用有关的
rm -rf $project/system/system/app/SimAppDialog
# USIM卡应用
rm -rf $project/system/system/app/Stk
# 系统跟踪
rm -rf $project/system/system/app/Traceur
# 安卓壁纸备份
rm -rf $project/system/system/app/WallpaperBackup
echo "精简system/priv-app"
# 系统打印服务
rm -rf $project/system/system/priv-app/BuiltInPrintService
# 通话记录备份
rm -rf $project/system/system/priv-app/CallLogBackup
# 广播服务相关，删了无影响
rm -rf $project/system/system/priv-app/CellBroadcastLegacyApp
rm -rf $project/system/system/priv-app/CellBroadcastServiceModulePlatform

# 动态注册广播接收者
rm -rf $project/system/system/priv-app/IntentResolver

# 动态壁纸
rm -rf $project/system/system/priv-app/LiveWallpapersPicker
# 本地翻译
rm -rf $project/system/system/priv-app/LocalTransport
# 超级用户管理
rm -rf $project/system/system/priv-app/ManagedProvisioning
# 无用
rm -rf $project/system/system/priv-app/MediaProviderLegacy
# 谷歌服务(删后无影响)
rm -rf $project/system/system/priv-app/ONS
# 软件包安装程序
rm -rf $project/system/system/priv-app/PackageInstaller
# 代理相关
rm -rf $project/system/system/priv-app/ProxyHandler
# 共享备份储存
rm -rf $project/system/system/priv-app/SharedStorageBackup
# 意图过滤器
rm -rf $project/system/system/priv-app/StatementService
# 用户字典
rm -rf $project/system/system/priv-app/UserDictionaryProvider
# 不影响小米的备份，可能影响谷歌的备份
rm -rf $project/system/system/priv-app/BackupRestoreConfirmation
echo "官方recovery恢复文件 及 系统验证"
rm -rf $sr/pangu/system/etc/permissions/security/verity_key
echo "精简product/app"
rm -rf $sr/recovery-from-boot.p
# 广告
rm -rf $sr/app/AnalyticsCore
# 小爱翻译
rm -rf $sr/app/AiAsstVision
# 相机标定
# rm -rf $sr/app/CameraTools_beta
# 捕捉日志
rm -rf $sr/app/CatchLog
# 配置拨号器
rm -rf $sr/app/ConferenceDialer
# 谷歌相关
rm -rf $sr/app/GoogleExtShared
# Google 位置记录
rm -rf $sr/app/GoogleLocationHistory
# 打印相关
rm -rf $sr/app/GooglePrintRecommendationService
# 快应用服务框架
rm -rf $sr/app/HybridPlatform
# 媒体播放器
rm -rf $sr/app/MediaViewer
# 用户反馈
rm -rf $sr/app/MiBugReport
# 游戏高能时刻
rm -rf $sr/app/MiGameService
# 钱包
rm -rf $sr/app/MIpay
# 小米无障碍
rm -rf $sr/app/MIUIAccessibility
# 小爱通话
rm -rf $sr/app/MIUIAiasstService
# Cit
rm -rf $sr/app/MiuiCit
# 家人守护
rm -rf $sr/app/MIUIgreenguard
# UI信息工具
rm -rf $sr/app/MIUIReporter
# 小米安全键盘
rm -rf $sr/app/MIUISecurityInputMethod
# 悬浮球
rm -rf $sr/app/MIUITouchAssistant
# 智能服务
rm -rf $sr/app/MSA
# OTA功能相关
rm -rf $sr/app/OtaProvision
# OTRP 协议协商程序（物联网）
rm -rf $sr/app/OTrPBroker
# 米币支付
rm -rf $sr/app/PaymentService
# 驾驶模式的音频播放
rm -rf $sr/app/RideModeAudio
rm -rf $sr/app/SecurityOnetrackService
rm -rf $sr/app/system
# Android 无障碍套件
rm -rf $sr/app/talkback
# uim卡相关
rm -rf $sr/app/uimgbaservice
rm -rf $sr/app/uimlpaservice
rm -rf $sr/app/uimremoteclient
rm -rf $sr/app/uimremoteserver
# 银联可信服务安全组件小米版本
rm -rf $sr/app/UPTsmService
rm -rf $sr/app/WMService
rm -rf $sr/app/XiaoaiRecommendation
# 连接车
rm -rf $sr/app/CarWith
# 系统更新
rm -rf $sr/app/Updater
# 音乐
rm -rf $sr/app/Music
echo "精简product/priv-app"
# 运营商服务
rm -rf $sr/priv-app/AutoRegistration
# 证书管理
rm -rf $sr/priv-app/ConfigUpdater
# Google Play 服务
rm -rf $sr/priv-app/GmsCore
# Google Play 服务更新程序
rm -rf $sr/priv-app/GooglePlayServicesUpdater
# 浏览器
rm -rf $sr/priv-app/MIUIBrowser
# 设置建议
rm -rf $sr/priv-app/SettingsIntelligence
# 游戏服务
rm -rf $sr/priv-app/MiGameCenterSDKService
# 搜索
rm -rf $sr/priv-app/MIUIQuickSearchBox
echo "精简其他"
# 数字钥匙，车钥匙
rm -rf $project/system_ext/app/digitalkey
# 打印处理服务
rm -rf $project/system_ext/app/MiuiPrintSpooler
rm -rf $project/system_ext/app/MiuixEditor
# 虚拟SIM卡内核
rm -rf $project/system_ext/app/VsimCore
# 急救信息
rm -rf $project/system_ext/priv-app/EmergencyInfo
# Google 服务框架
rm -rf $project/system_ext/priv-app/GoogleServicesFramework
# 米币支付
rm -rf $project/vendor/app/MipayService
# 无用主题
rm -rf $sr/media/theme/MILanProVF.mtz
rm -rf $sr/media/theme/custom_online_ids.mrm
rm -rf $sr/media/theme/default.mtz
# 云控
rm -rf $sr/pangu/system/app/Joyose
echo "精简product/data-app"
rm -rf $sr/data-app/*
# 查找并删除文件和文件夹
find "$rmm" -type f -print0 | while IFS= read -r -d '' file; do
    echo "清理$file"
    rm "$file"
done

find "$rmm" -type d -print0 | while IFS= read -r -d '' dir; do
    echo "清理$dir"
    rm -r "$dir"
done

echo "com.* 推广广清理完毕"
echo ""
echo "精简无用APP完毕......"



