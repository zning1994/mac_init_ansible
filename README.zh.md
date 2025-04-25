# 🚀 Mac 新机开发环境初始化 (Ansible 版)

本项目通过 Ansible 快速在全新 macOS 设备上搭建开发环境，适用于个人开发者、工程师进行 Flutter、Node.js、Python、Kubernetes、Docker 等开发。

---

🌐 [英文版说明（English Version Guide）](./README.md)

---

## 📦 项目结构

```
mac-init/
├── inventory.yml
├── mac-init.yml
└── roles/
    └── common/
        └── tasks/
            └── main.yml
```

---

## ⚙️ 安装前准备

无需手动安装！只需运行下方一键脚本：

----

## 🚀 一键初始化（推荐）

在项目根目录直接运行：

```bash
bash ./init.sh
```

该脚本会自动：
- 检查并安装 Xcode Command Line Tools（如未安装）
- 安装 Homebrew（如未安装）
- 安装 Ansible（如未安装）

完成后即可运行 Ansible Playbook：

```bash
ansible-playbook -i inventory.yml mac-init.yml --ask-become-pass
```

执行过程中会提示输入本机用户的 sudo 密码。

----

## 📚 初始化内容包括

- 安装 Homebrew 及常用 CLI 工具（nvm, pyenv, poetry 等）
- 安装常用 GUI 应用（VSCode, Docker, Android Studio, 1Password 等）
- 下载并解压 Flutter SDK (3.29.3)
- 配置 Flutter 到 PATH，初始化 `flutter doctor`
- 安装并配置 FVM（Flutter 版本管理器）
- 配置 NVM 环境，支持 Node.js 多版本管理
- 安装 CocoaPods
- 自动执行 Xcode 路径修正及首次初始化（`xcode-select` & `xcodebuild -runFirstLaunch`）

---

## ⚠️ 注意事项

- Xcode 本体需提前从 App Store 手动安装；
- Android Studio 安装后第一次启动需要手动完成 SDK 配置；
- Flutter doctor 会提示其他个性化调整（如模拟器安装、插件安装等）。

---

## 🗝️ Shell & Git/SSH 环境一键初始化

本仓库支持自动化配置你的 Zsh（Oh My Zsh 及插件）、Git 全局信息和 SSH 密钥，适用于新 Mac 环境。

### 自动完成内容

- **Homebrew**（自动检测并安装）
- **Oh My Zsh**（静默安装）
- **Zsh 插件**：
  - zsh-syntax-highlighting
  - zsh-autosuggestions
  - zsh-completions
- **最小化 `.zshrc`**，内容如下：
  ```zsh
  ZSH_THEME="agnoster"
  plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-completions
  )
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source $ZSH/oh-my-zsh.sh
  ```
- **Git 全局 user.name & user.email**（通过变量设置）
- **自动生成 SSH key（ed25519）并添加到 ssh-agent**
- **自动生成 GitHub SSH 配置文件（`~/.ssh/config`）**

### 使用方法

1. （可选）编辑 `roles/common/vars/main.yml`，设置你的 `git_user_name`、`git_user_email` 和 `ssh_key_path`。
2. 执行：
   ```bash
   ansible-playbook -i inventory.yml mac-init.yml
   ```
3. 完成后：
   - 打开新终端窗口，激活新的 Zsh 配置。
   - 将 `~/.ssh/id_ed25519.pub` 公钥添加到你的 GitHub 账户。

#### 仅执行 shell/git/ssh 初始化

如果你只想单独完成 shell 环境（Oh My Zsh、插件、git、ssh）配置，可以执行：

```bash
ansible-playbook -i inventory.yml os-config-playbook.yml
```

这样只会执行 `roles/common/tasks/os_config.yml` 里的任务，不会运行其它初始化内容。

### 前置要求

- macOS，需有 sudo 权限
- 能联网（用于 Homebrew、Oh My Zsh 及插件安装）

---

## ✨ 后续可扩展

- 支持自动安装 JetBrains Toolbox，统一管理 IntelliJ IDEA, GoLand, PyCharm
- 配置 awscli, terraform, eksctl 等云原生开发环境
- 自动绑定 GitHub SSH Key

---

## 👨‍💻 作者
- 配置工程设计：张宁 (ChatGPT 协助)
- 更新时间：2025-04

---

> 保持环境干净，提升开发效率，从第一天开始！💻

