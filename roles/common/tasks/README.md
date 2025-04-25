# 🚀 Mac 新机开发环境初始化 (Ansible 版)

本项目通过 Ansible 快速在全新 macOS 设备上搭建开发环境，适用于个人开发者、工程师进行 Flutter、Node.js、Python、Kubernetes、Docker 等开发。

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

1. **手动安装 Xcode Command Line Tools** （如未安装）：

```bash
xcode-select --install
```

2. **安装 Homebrew**（如果还没安装）：

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

3. **安装 Ansible**（第一次用的话）：

```bash
brew install ansible
```

---

## 🚀 执行初始化

### 1. 切换到项目目录

```bash
cd mac-init
```

### 2. 执行 Playbook

```bash
ansible-playbook -i inventory.yml mac-init.yml --ask-become-pass
```

执行过程中会提示输入本机用户的 sudo 密码。

---

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

## ✨ 后续可扩展

- 支持自动安装 JetBrains Toolbox，统一管理 IntelliJ IDEA, GoLand, PyCharm
- 配置 awscli, terraform, eksctl 等云原生开发环境
- 自动绑定 GitHub SSH Key

---

## 👨‍💻 作者
- 配置工程设计：宁 Zhang (ChatGPT 协助)
- 更新时间：2025-04

---

> 保持环境干净，提升开发效率，从第一天开始！💻

