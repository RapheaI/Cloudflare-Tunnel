#!/bin/bash

# 检查是否为 Root 权限
if [ "$(id -u)" != "0" ]; then
    echo "错误: 请使用 root 权限运行此脚本 (sudo -i)"
    exit 1
fi

echo "--- 开始安装 Cloudflare Tunnel (cloudflared) ---"

# 1. 自动检测架构
ARCH=$(uname -m)
case $ARCH in
    x86_64)
        BINARY_URL="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64"
        ;;
    aarch64)
        BINARY_URL="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64"
        ;;
    armv7l)
        BINARY_URL="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm"
        ;;
    *)
        echo "不支持的架构: $ARCH"; exit 1
        ;;
esac

# 2. 下载并安装
echo "正在从官方 GitHub 下载二进制文件 ($ARCH)..."
curl -L --output /usr/local/bin/cloudflared $BINARY_URL
chmod +x /usr/local/bin/cloudflared

# 验证安装
if /usr/local/bin/cloudflared --version >/dev/null 2>&1; then
    echo "Cloudflared 安装成功！"
else
    echo "安装失败，请检查网络连接。"
    exit 1
fi

---

# 3. 交互式填写 Token
echo ""
read -p "请输入你的 Cloudflare Tunnel Token: " CF_TOKEN
if [ -z "$CF_TOKEN" ]; then
    echo "Token 不能为空，脚本退出。"
    exit 1
fi

# 4. 安装并启动服务
echo "正在配置系统服务..."
/usr/local/bin/cloudflared service install $CF_TOKEN

# 启动并设置自启
systemctl start cloudflared
systemctl enable cloudflared

echo "--- 安装配置完成！ ---"
echo "当前状态:"
systemctl status cloudflared --no-indexer --line-numbers | grep "Active:"