# Changelog – Hash-Gen

All notable changes to this project will be documented in this file.

---

## [1.0.1] – 2025-02-25

### Added
- Professional header block with version, author, license and feature overview.
- Multi-file drag-and-drop support.
- Explicit network path (UNC) detection and rejection.
- Centralized hash algorithm configuration (`Algorithms` variable).
- Enterprise-style documentation structure (`README`, `LICENSE`, `docs/`).

### Changed
- Improved error handling for missing PowerShell.
- Stabilized PowerShell hash parsing using `Get-FileHash`.
- Cleaned and standardized console output.

### Fixed
- Resolved an issue where hash values could be displayed incorrectly when PowerShell output parsing failed.

---

## [1.0.0] – Initial Release

### Added
- Initial drag-and-drop hashing script.
- Calculation of MD5, SHA1, SHA256 and SHA512 via PowerShell `Get-FileHash`.
- Per-file `<filename>_hashes.txt` report generation.
