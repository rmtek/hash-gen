# Hash-Gen – Windows File Hashing Tool

![Version](https://img.shields.io/badge/Version-1.0.1-blue)
![Status](https://img.shields.io/badge/Status-Stable-brightgreen)
![Windows](https://img.shields.io/badge/Windows-8%2F10%2F11%20%7C%20Server%202019%2F2022%2F2025-lightgrey)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue)](LICENSE)

**Hash-Gen** is a portable drag-and-drop hashing tool for Windows.  
It generates MD5, SHA1, SHA256 and SHA512 checksums using PowerShell — fully offline and installation-free.

---

## 🚀 Features
- Multi-file drag & drop support  
- Generates **MD5 / SHA1 / SHA256 / SHA512**  
- Creates `<filename>_hashes.txt`  
- No installation required  
- 100% offline, USB-ready  
- Works on Windows 8/10/11 & Server 2019/2022/2025  

---

## 📥 Download
https://github.com/rmtek/hash-gen

---

## 🧪 Usage
**Drag & Drop:**  
Ziehe eine oder mehrere Dateien auf `hash-gen.bat`.

**Command Line:**
```
hash-gen.bat C:\path\file.iso
```

---

## 📄 Output Example
```
MD5:     1A2B3C...
SHA1:    ABC123...
SHA256:  9F8E7D...
SHA512:  ...
```
Ergebnis wird gespeichert als:
```
<filename>_hashes.txt
```

---

## 🔒 Security
- Keine Internetverbindung  
- Keine Dateimanipulation  
- Open, transparent batch code  

---

## 🗂️ Structure
```
hash-gen/
├─ hash-gen.bat
├─ README.md
├─ LICENSE
├─ RELEASE_NOTES.md
└─ docs/
   ├─ CHANGELOG.md
   └─ ARCHITECTURE.md
```

---

## 👤 Author
Ronald Michelic  
https://rmtek.net  
rm@rmtek.net

---

## 💙 Support
https://www.paypal.com/donate/?hosted_button_id=U4MVM7GJ5XMDY
