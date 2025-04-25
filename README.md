# 🚀 Mac New Device Development Environment Initialization (Ansible Version)

This project uses Ansible to quickly set up a development environment on a brand new macOS device. It is suitable for personal developers and engineers for Flutter, Node.js, Python, Kubernetes, Docker development.

---

🌐 [中文版说明（Chinese Version Guide）](./README.zh.md)

---

## 📦 Project Structure

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

## ⚙️ Pre-requisites

No manual pre-installation needed! The following script will help you:

---

## 🚀 Quick Start (Recommended)

Just run the initialization script in the project root:

```bash
bash ./init.sh
```

This script will automatically:
- Check and install Xcode Command Line Tools (if missing)
- Install Homebrew (if missing)
- Install Ansible (if missing)

Once finished, you can run the Ansible playbook:

```bash
ansible-playbook -i inventory.yml mac-init.yml --ask-become-pass
```

You will be prompted to enter your macOS user sudo password during execution.

---

## 📚 Initialization Contents

- Install Homebrew and common CLI tools (nvm, pyenv, poetry, etc.)
- Install common GUI applications (VSCode, Docker, Android Studio, 1Password, etc.)
- Download and unzip Flutter SDK (3.29.3)
- Configure Flutter into PATH and initialize via `flutter doctor`
- Install and configure FVM (Flutter Version Manager)
- Set up NVM environment for Node.js version management
- Install CocoaPods
- Automatically fix Xcode path and initialize via `xcode-select` and `xcodebuild -runFirstLaunch`

---

## ⚠️ Notes

- Xcode must be manually installed via the App Store beforehand;
- After Android Studio installation, first launch is needed to complete SDK setup;
- `flutter doctor` may prompt further personalized adjustments (e.g., simulator installation, plugin installation).

---

## ✨ Future Extensions

- Support auto-installation of JetBrains Toolbox to manage IntelliJ IDEA, GoLand, PyCharm
- Configure awscli, terraform, eksctl for cloud-native development
- Auto bind GitHub SSH keys

---

## 👨‍💻 Author
- Configuration Design: Ning Zhang (with ChatGPT Assistance)
- Updated: April 2025

---

> Keep your environment clean, boost development efficiency from Day 1! 💻


