# Xiaomi HyperOS 官改制作
## 首要命令
   ```bash
   sudo chmod 0755 *
   ```
## zst 转换命令
   ```bash
   sudo apt update
   sudo apt install zstd
   zstd  --rm -d super.zst -o super.img
   ```