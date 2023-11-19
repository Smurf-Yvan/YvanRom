# Xiaomi HyperOS 官改制作
## 使用教程
打开GitHub codespaces后,由于GitHub只给了workspace分区了32G（实际剩余如图），而tmp却有100多G之余（不知道是怎么想的），于是我们要把工作目录放至/tmp
![Alt text](Doc/image.png)
   ```bash
   cp -r TIK /tmp/
   cd TIK
   sudo ./run
   ```

## 其他命令
   ```bash
   sudo chmod 0755 *
   ```
## zst 转换命令
   ```bash
   sudo apt update
   sudo apt install zstd
   zstd  --rm -d super.zst -o super.img
   ```