# 📱 NetHunter KSU Installer

> 🌑 **NetHunter module** with support for custom LineageOS-based ROMs and alternative root **KernelSU** (KSU).

---

## 📌 About this repo

This repository is a **modified version of the original NetHunter Magisk module**, adapted for **KernelSU (KSU)**.
What was changed? — **nothing, I just added modified an install.sh script that helps install the NetHunter module via the KSU manager.**
The project is based on the idea from [poxiao676/Nethunter_KSU_Module](https://github.com/poxiao676/Nethunter_KSU_Module), but:

- ❌ The original module has not been updated for a long time
- ✅ It was decided to simplify, clean up, and adapt it to current realities. Fixed rootfs installation and boot animation
for custom A14 and A15 ROMs based on LineageOS

---

## 🚀 Features

✅ Support for **KernelSU NEXT (KSU)**
✅ Automatic **installer with `install.sh`** 
✅ Works with **custom LineageOS-based ROMs**
✅ Support for **root** and **boot animation**

## 🧠 Installation
1. Download a suitable rootfs from https://kali.download/nethunter-images/current/rootfs/
2. Move this rootfs directly to the root directory of the module, then compress it into a zip file, and use KernelSU to flash it in.
3. Open KernelSU Manager
4. Select the `.zip` module and install it
5. Reboot the device

---

## 🛠️ Requirements

- **KernelSU**  
- **LineageOS-based ROM**
- A bit of patience 😉

---

## 🧾 Credits

- [poxiao676](https://github.com/poxiao676) — for the original idea and implementation
- [Offensive Security](https://www.kali.org/) — for NetHunter

---

## 🐾 Plans

- [ ] Automatic detection of KSU/Magisk

---

## 💬 Feedback  
ravenhoxs@gmail.com — **open to suggestions or improvements**

## 📜 License  
This project is licensed under the **GNU Affero General Public License v3.0 (AGPL-3.0)**.
See the [LICENSE](LICENSE) file for details.
