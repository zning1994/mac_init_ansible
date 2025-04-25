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
- Install common GUI applications (Google Chrome, iTerm2, VSCode, Sourcetree, DBeaver, IntelliJ IDEA, GoLand, PyCharm, Android Studio, 1Password, Postman, MySQL Workbench, Lens, MWeb Pro, AnyDesk, WeChat, WeChat Work, Telegram, Slack, Lark, Feishu, Resilio Sync, WhatsApp, ChatGPT, Claude)
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

## 🗝️ Shell & Git/SSH Environment Initialization

This repository provides an automated way to initialize your Zsh shell environment (with Oh My Zsh and plugins), as well as Git global config and SSH key for GitHub.

### What will be set up automatically?

- **Homebrew** (if missing)
- **Oh My Zsh** (unattended install)
- **Zsh plugins**:
  - zsh-syntax-highlighting
  - zsh-autosuggestions
  - zsh-completions
- **Minimal `.zshrc`** with:
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
- **Git global user.name & user.email** (set via variables)
- **SSH key (ed25519)** auto-generated and added to ssh-agent
- **GitHub SSH config** (`~/.ssh/config`) auto-generated

### How to use

1. (Optional) Edit `roles/common/vars/main.yml` to set your `git_user_name`, `git_user_email`, and `ssh_key_path`.
2. Run:
   ```bash
   ansible-playbook -i inventory.yml mac-init.yml
   ```
3. After completion:
   - Open a new terminal window to activate the new Zsh config.
   - Add your public SSH key (`~/.ssh/id_ed25519.pub`) to your GitHub account.

#### Run only the shell/git/ssh initialization

If you only want to set up the shell environment (Oh My Zsh, plugins, git, ssh), run:

```bash
ansible-playbook -i inventory.yml os-config-playbook.yml
```

This will only execute the tasks in `roles/common/tasks/os_config.yml` and will not run the rest of the main initialization tasks.

### Requirements

- macOS with sudo privileges
- Internet connection (for Homebrew, Oh My Zsh, and plugins)

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


