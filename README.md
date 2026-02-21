# 🌸 椿卷ฅ的CF连接器一键安装脚本

## 🚀 简介

这是一个专业简洁的 Cloudflare Tunnel 连接器一键安装脚本，包含自动更新功能。

## ✨ 特性

- ✅ **一键安装** - 自动化安装和配置
- ✅ **自动更新** - 每日自动检测并升级
- ✅ **多架构支持** - x86_64, aarch64
- ✅ **Systemd服务** - 专业的服务管理
- ✅ **Crontab任务** - 定时自动维护

## 📦 快速安装

### 一键安装
```bash
bash <(curl -s https://raw.githubusercontent.com/RapheaI/Cloudflare-Tunnel/main/cf-connector-installer.sh)
```

### 手动安装
```bash
# 1. 下载脚本
curl -s -o cf-connector-installer.sh https://raw.githubusercontent.com/RapheaI/Cloudflare-Tunnel/main/cf-connector-installer.sh

# 2. 运行安装
chmod +x cf-connector-installer.sh
sudo ./cf-connector-installer.sh
```

## 🔧 安装过程

### **1. 安装 Cloudflare Tunnel**
- 🔐 权限检查
- 🏗️ 架构检测 (x86_64, aarch64)
- ⬇️ 下载官方二进制

### **2. 配置隧道 Token**
- 🔑 交互式输入Token
- ⚙️ 安装系统服务
- 🚀 启动并启用服务

### **3. 配置自动更新**
- 📝 创建更新脚本
- ⏰ 设置每日定时任务
- 🔄 自动重启服务

## 📋 所需信息

- **Cloudflare Tunnel Token** - 你的隧道令牌

## 🛠️ 管理命令

### 服务管理
```bash
# 启动服务
systemctl start cloudflared

# 停止服务
systemctl stop cloudflared

# 重启服务
systemctl restart cloudflared

# 查看状态
systemctl status cloudflared

# 启用自启
systemctl enable cloudflared

# 禁用自启
systemctl disable cloudflared
```

### 手动更新
```bash
# 手动运行更新
/usr/local/bin/update-cloudflared.sh

# 查看更新日志
cat /var/log/cloudflared-update.log
```

### 日志查看
```bash
# 查看服务日志
journalctl -u cloudflared -f

# 查看隧道信息
cloudflared tunnel info
```

## 📁 文件结构

```
/usr/local/bin/cloudflared          # Cloudflared二进制文件
/usr/local/bin/update-cloudflared.sh # 自动更新脚本
/etc/systemd/system/cloudflared.service  # 系统服务文件
/var/log/cloudflared-update.log     # 更新日志文件
```

## 🔄 自动更新

### 更新计划
- **时间**: 每天凌晨 3:00
- **操作**: 自动检测新版本并升级
- **重启**: 更新后自动重启服务
- **日志**: 记录到 `/var/log/cloudflared-update.log`

### 更新流程
1. ⬇️ 检查新版本
2. 🔄 下载并安装
3. 🔁 重启服务
4. 📝 记录日志

## 🔍 故障排除

### 安装失败
```bash
# 检查网络连接
curl -I https://github.com

# 检查架构支持
uname -m
```

### 服务问题
```bash
# 查看详细错误
systemctl status cloudflared -l

# 检查Token有效性
cloudflared tunnel list
```

### 更新问题
```bash
# 手动运行更新
/usr/local/bin/update-cloudflared.sh

# 检查Crontab任务
crontab -l
```

## 🎯 支持的架构

- ✅ **x86_64** - 标准64位服务器
- ✅ **aarch64** - ARM64设备（树莓派4等）

## 💡 使用提示

1. **获取Token**: 在Cloudflare Zero Trust面板创建隧道
2. **网络要求**: 确保可以访问GitHub和Cloudflare
3. **自动维护**: 系统会自动保持最新版本
4. **验证状态**: 安装后在Cloudflare面板查看

## 📄 许可证

MIT License - 椿卷ฅ 版权所有

---

**🌸 椿卷ฅ的专业CF连接器安装系统**
