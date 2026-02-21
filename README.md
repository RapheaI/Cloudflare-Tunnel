# 🌸 椿卷ฅ的CF连接器一键安装脚本

## 🚀 简介

这是一个简洁高效的 Cloudflare Tunnel 连接器一键安装脚本，基于官方推荐的最佳实践。

## ✨ 特性

- ✅ **极致简洁** - 最少的代码实现完整功能
- ✅ **自动架构检测** - x86_64, aarch64, armv7l
- ✅ **官方二进制** - 直接从GitHub Releases下载
- ✅ **服务安装** - 使用官方service install命令
- ✅ **权限检查** - 确保root权限运行

## 📦 快速安装

### 一键安装
```bash
# 🌸 使用椿卷ฅ的标准语法
bash <(curl -s https://raw.githubusercontent.com/RapheaI/cf-connector-installer/main/cf-connector-installer.sh)
```

### 手动安装
```bash
# 1. 下载脚本
curl -s -o cf-connector-installer.sh https://raw.githubusercontent.com/RapheaI/cf-connector-installer/main/cf-connector-installer.sh

# 2. 运行安装
chmod +x cf-connector-installer.sh
sudo ./cf-connector-installer.sh
```

## 🔧 安装过程

1. 🔐 **权限检查** - 验证root权限
2. 🏗️ **架构检测** - 自动检测系统架构
3. ⬇️ **下载安装** - 下载官方cloudflared二进制
4. 🔑 **Token输入** - 输入Cloudflare Tunnel Token
5. ⚙️ **服务配置** - 安装并启动系统服务
6. ✅ **状态验证** - 显示服务运行状态

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

### 日志查看
```bash
# 查看服务日志
journalctl -u cloudflared -f

# 查看cloudflared日志
cloudflared tunnel info
```

## 📁 文件位置

```
/usr/local/bin/cloudflared          # Cloudflared二进制文件
/etc/systemd/system/cloudflared.service  # 系统服务文件
```

## 🔍 故障排除

### 安装失败
```bash
# 检查网络连接
curl -I https://github.com

# 手动下载测试
curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 --output /tmp/test
```

### 服务启动失败
```bash
# 查看详细错误
systemctl status cloudflared -l

# 检查Token有效性
cloudflared tunnel list
```

### Token问题
```bash
# 重新安装服务
cloudflared service uninstall
cloudflared service install <NEW_TOKEN>
```

## 🎯 支持的架构

- ✅ **x86_64** - 标准64位服务器
- ✅ **aarch64** - ARM64设备（树莓派4等）
- ✅ **armv7l** - ARM32设备（树莓派3等）

## 💡 使用提示

1. **获取Token**: 在Cloudflare Zero Trust面板创建隧道获取Token
2. **网络要求**: 确保服务器可以访问GitHub和Cloudflare服务
3. **防火墙**: 确保出站连接正常
4. **验证**: 安装完成后在Cloudflare面板查看隧道状态

## 📄 许可证

MIT License - 椿卷ฅ 版权所有

---

**🌸 椿卷ฅ的简洁高效CF连接器安装系统**