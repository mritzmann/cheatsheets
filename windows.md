# Windows 11

## AllowUpgradesWithUnsupportedTPMOrCPU

Allow upgrades from Windows 10 to 11 with unsupported TPM or CPU

1. `regedit`
2. Navigato to `HKEY_LOCAL_MACHINE\SYSTEM\Setup\MoSetup`
3. Create `AllowUpgradesWithUnsupportedTPMOrCPU` (type: REG_DWORD; value: 1)

https://support.microsoft.com/en-us/windows/ways-to-install-windows-11-e0edbbfb-cfc5-4011-868b-2ce77ac7c70e

## Block Microsoft Account

1. `gpedit.msc`
2. Computerkonfiguration -> Windows-Einstellungen -> Sicherheitseinstellungen -> Lokale Richtlinien -> Sicherheitsoptionen
3. Set `Konten: Microsoft-Konten blockieren` to `Benutzer können keine Microsoft-Konten hinzufügen oder sich damit anmelden`
