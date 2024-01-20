# Xiaomi HyperOS 官改制作
## 基于做包工具TIK 此仓库为Linux简易教程
## 使用教程
打开GitHub codespaces后,由于GitHub只给了workspace分区了32G（实际剩余如图），而tmp却有100多G之余（不知道是怎么想的），于是我们要把工作目录放至/tmp
### 你不使用codespace 除外
![Alt text](Doc/image.png)
   ```bash
   cp -r TIK /tmp/ && cd /tmp/TIK && sudo ./run
   ```

## 其他命令
   ```bash
   sudo chmod 0755 *
   aria2c '' -s 64 -x 16 -c -o xxx.zip
   du -sh ./*
   sudo rm -rf /tmp/TIK/你的项目名/super.img
   sudo rm -rf /tmp/TIK/你的项目名/*.img
   sudo mv /tmp/TIK/你的项目名/TI_out/super.img ./
   7z x xxx.7z -r -oxxx
   7z a -t7z -r xxx.7z ./*
   ./OneDriveUploader -s "文件位置" "Personal_Interest"
   ```
## zst 转换命令
   ```bash
   sudo apt update
   sudo apt install zstd
   sudo zstd  --rm -d super.zst -o /tmp/TIK/你的项目名/super.img
   sudo zstd --rm super.img -o super.zst
   ```