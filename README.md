# Hash-Gen – Windows File Hashing Tool

![Version](https://img.shields.io/badge/Version-1.0.1-blue)
![Status](https://img.shields.io/badge/Status-Stable-brightgreen)
![Platform](https://img.shields.io/badge/Windows-8%2F10%2F11%20%7C%20Server%202019%2F2022%2F2025-lightgrey)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue)](LICENSE)

**Hash-Gen** is a portable drag-and-drop hashing tool for Windows.  
It calculates MD5, SHA1, SHA256, and SHA512 using PowerShell — offline, fast, and installation-free.

## Features
- Drag & drop multi-file support
- MD5, SHA1, SHA256, SHA512 output
- Generates `<filename>_hashes.txt`
- Offline, portable, USB-ready
- Works on Windows 8/10/11 + Server 2019/2022/2025

## Download
Latest release:  
https://github.com/rmtek/hash-gen/releases/latest

## Usage
Drag files onto `hash-gen.bat` or run:
```
hash-gen.bat C:\path\file.iso
```
YT Video:  
https://www.youtube.com/watch?v=Xz71DNbUPXA

## Example Output
```
MD5 Hash: 0AEBC4E3058C41D13EE4B07E23B77181
SHA1 Hash: 5BAC4FE2C0570F48DD4A0F2EB9646BC10543953D
SHA256 Hash: 72270361C65E20DFAC1EFD95A33A61F63C4A06AF9D323F3721DF8BC144407620
SHA512 Hash: 6AD919BBFD9025662037AFEAEDCFB7DAA1E88BDECE76C9C998381E0319B9AB46CC53C5E68E870B012B26C684232B882C3DF31D459390D699A3648043D79179E2
```

## Security
- No network access  
- No file modification  
- Fully transparent batch code  

## Structure
```
hash-gen.bat
README.md
LICENSE
docs/
  ├─ CHANGELOG.md
  └─ ARCHITECTURE.md
```

## Author
Ronald Michelic — https://rmtek.net  
Contact: rm@rmtek.net

## Support
https://www.paypal.com/donate/?hosted_button_id=U4MVM7GJ5XMDY

## License
BSD 3-Clause License.
