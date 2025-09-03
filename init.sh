#!/bin/bash

echo "🔧 开始初始化 Mac 环境（安装 Homebrew + Ansible）..."

# 在继续之前检查 Git 配置是否已从默认值修改
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DEFAULTS_FILE="$SCRIPT_DIR/roles/common/defaults/main.yml"
if [ -f "$DEFAULTS_FILE" ]; then
  if grep -q 'git_user_name: "Your Name"' "$DEFAULTS_FILE" || \
     grep -q 'git_user_email: "your.email@example.com"' "$DEFAULTS_FILE"; then
    echo "⚠️ 检测到 $DEFAULTS_FILE 中的 Git 配置仍为默认值。"
    echo "   请先编辑该文件，设置 git_user_name 和 git_user_email 后再运行本脚本。"
    echo "   示例：git_user_name: \"你的名字\"，git_user_email: \"you@example.com\""
    exit 1
  fi
fi

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

echo "✅ 初始化完成！请确保你在 App Store 安装好 Xcode，然后运行："
echo "    ansible-playbook -i inventory.yml os-config-playbook.yml"
echo "    ansible-playbook -i inventory.yml mac-init.yml --ask-become-pass"