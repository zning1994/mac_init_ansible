#!/bin/bash

echo "🔧 开始初始化 Mac 环境（安装 Homebrew + Ansible）..."

# 检查并安装 Xcode Command Line Tools（用于编译类工具）
if ! xcode-select -p &>/dev/null; then
  echo "📦 安装 Xcode 命令行工具..."
  xcode-select --install
  echo "请等待安装完成后重新运行本脚本。"
  exit 1
else
  echo "✅ Xcode 命令行工具已安装"
fi

# 安装 Homebrew（如未安装）
if ! command -v brew &>/dev/null; then
  echo "📦 安装 Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "✅ Homebrew 已安装"
fi

# 安装 Ansible
if ! command -v ansible &>/dev/null; then
  echo "📦 安装 Ansible..."
  brew install ansible
else
  echo "✅ Ansible 已安装"
fi

# 输出版本确认
echo "🧪 版本确认："
ansible --version
brew --version

echo "✅ 初始化完成！你现在可以运行："
echo "    ansible-playbook -i inventory.yml mac-init.yml"