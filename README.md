# TCP-TimeSync-UTC8

[GitHub Repository](https://github.com/huangsen365/TCP-TimeSync-UTC8)

Synchronize your Windows system clock to **Shanghai time (UTC+8)** using PowerShell.

## Purpose

This PowerShell script (`Update-Clock.ps1`) automatically updates your computer's system clock to the current Shanghai time (UTC+8) once every 24 hours, using data from [worldtimeapi.org](https://worldtimeapi.org/).
It includes robust retry logic and helpful status messages.

## Requirements

* **Windows** with PowerShell
* **Administrator privileges** (to allow updating the system time)
* **Internet connection** (to reach the time API)

## How to Run

1. **Download** or clone this repository:

   ```bash
   git clone https://github.com/huangsen365/TCP-TimeSync-UTC8.git
   ```

2. **Right-click** on `Update-Clock.ps1` and select **"Run with PowerShell ISE as Administrator"**
   Alternatively, open PowerShell **as Administrator** and run:

   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope Process
   .\Update-Clock.ps1
   ```

3. The script will update your system time to Shanghai time and repeat every 24 hours.

> **Note:**
> Running as administrator is required to update the system clock.
> Press `Ctrl+C` in the PowerShell window to stop the script.

## Change Timezone

By default, the script syncs to **Shanghai (UTC+8)** using this API:

```powershell
$timeApiUrl = "https://worldtimeapi.org/api/timezone/Asia/Shanghai"
```

If you want to synchronize with **Singapore** or **Beijing** instead, you can **modify the `$timeApiUrl`** variable in the script:

* Singapore:
  `https://worldtimeapi.org/api/timezone/Asia/Singapore`
* Beijing:
  `https://worldtimeapi.org/api/timezone/Asia/Beijing`

All three locations use UTC+8 and will provide the same time.
