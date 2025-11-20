# Architecture – Hash-Gen

## Overview
Hash-Gen is a Windows batch script that uses PowerShell `Get-FileHash` to compute cryptographic hashes.

## Flow
1. Initialize console UI and color system  
2. Validate PowerShell availability  
3. Validate arguments  
4. For each file:
   - Ensure local path (no UNC)
   - Compute all hash algorithms
   - Write results to console and report file  
5. Display exit menu

## Hash Engine
```
powershell -NoProfile -command "(Get-FileHash -Algorithm ALG '%file%').Hash"
```

## Output Files
Each file produces:
```
<filename>_hashes.txt
```

## Design Goals
- Zero installation  
- USB portability  
- Fully offline  
- Transparent and auditable  
