# Architecture – Hash-Gen

This document provides a brief technical overview of the Hash-Gen implementation.

---

## 1. Technology Stack

- **Script type:** Windows Batch (`.bat`)
- **Runtime dependency:** PowerShell (`powershell.exe`)
- **Hash engine:** `Get-FileHash` (PowerShell cmdlet)

---

## 2. High-Level Flow

1. Initialize console window (title, size, colors).
2. Initialize color-text helper (`:CT`) and informational banners.
3. Validate environment:
   - Verify PowerShell is available in `PATH`.
4. Validate input:
   - Exit with usage message if no arguments are passed.
5. For each argument (file path):
   - Normalize to full path.
   - Reject non-existing files.
   - Reject network/UNC paths.
   - Compute hashes using PowerShell:
     - MD5, SHA1, SHA256, SHA512.
   - Render results to console (colored output).
   - Persist results to `<filename>_hashes.txt` in the same directory.
6. Show final menu:
   - Open donation link.
   - Exit to CMD.
   - Exit script.

---

## 3. Hash Calculation

Hash-Gen delegates hashing to PowerShell:

```bat
powershell -NoProfile -command "(Get-FileHash -Algorithm %%A '%file%').Hash"
```

Where:

- `%%A` is one of `MD5`, `SHA1`, `SHA256`, `SHA512`.
- `%file%` is the fully qualified path to the target file.

The raw hash string is captured via `for /f` and stored in delayed-expansion variables:

```bat
set "hash[%%A]=%%B"
```

---

## 4. Output Files

For each input file:

- Output file name:  
  `<original_filename>_hashes.txt`
- Location:  
  Same directory as the input file.
- Content:
  - One header line identifying the original file.
  - One line per hash algorithm and hash value.

---

## 5. Color Text System

Hash-Gen uses a small helper label `:CT` to render colored text using `findstr` and console escape codes.

Example usage (indirect call):

```bat
set InfoText_1=:CT 03 "   Windows file hashing with PowerShell"
call %InfoText_1%
```

This mechanism allows consistent colored output without external tools.

---

## 6. Design Goals

- Zero installation
- Minimal dependencies
- Transparency (plain-text script)
- Portability (suitable for USB-based toolkits)
- Predictable behavior in locked-down enterprise environments
