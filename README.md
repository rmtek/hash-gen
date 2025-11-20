# Hash-Gen – Windows File Hashing Tool

![Version](https://img.shields.io/badge/Version-1.0.1-blue)
![Status](https://img.shields.io/badge/Status-Stable-brightgreen)
![Platform](https://img.shields.io/badge/Windows-8%2F10%2F11%20%7C%20Server%202019%2F2022%2F2025-lightgrey)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue)](LICENSE)

**Hash-Gen** is a portable drag-and-drop hashing tool for Windows.  
It calculates MD5, SHA1, SHA256, and SHA512 using PowerShell — offline, fast and installation-free.

---

## 🔧 Features
- Drag & drop multiple files
- Hashes: **MD5**, **SHA1**, **SHA256**, **SHA512**
- Creates `<filename>_hashes.txt`
- Fully offline, USB-ready
- Works on Windows 8/10/11 + Server 2019/2022/2025

---

## 📥 Download
Latest version:  
https://github.com/rmtek/hash-gen

---

## ▶️ Usage
### Drag & Drop  
Drop one or more files onto `hash-gen.bat`.  
Hashes are shown in the console and saved as text files.

---

## 📄 Example Output
```
MD5:    1A2B3C...
SHA1:   A1B2C3...
SHA256: F1E2D3...
SHA512: ...
```

---

## 🛡️ Security
- No network access  
- No modification of input files  
- Plain-text batch script (auditable)

---

## 📂 Project Structure
```
hash-gen.bat
README.md
LICENSE
RELEASE_NOTES.md
docs/
  ├─ CHANGELOG.md
  └─ ARCHITECTURE.md
```

---

## 👤 Author
Ronald Michelic — https://www.rmtek.net  
Contact: rm@rmtek.net

---

## 💙 Support
https://www.paypal.com/donate/?hosted_button_id=U4MVM7GJ5XMDY

---

## 📜 License
BSD 3-Clause License.
