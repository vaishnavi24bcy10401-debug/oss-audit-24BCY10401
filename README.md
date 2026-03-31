 # Open Source Software Audit – Capstone Project

**Student Details**

| Field | Value |
|-------|-------|
| Name | Animesh Agrawal|
| Registration Number | 24BCY10151 |
| Course | Open Source Software (NGMC) |
| Date | March 28, 2026 |

## Chosen Software
**Firefox** – Open source web browser by Mozilla

**Scripts**

| File | Purpose |
|------|---------|
| script1.sh | System Identity Report |
| script2.sh | FOSS Package Inspector |
| script3.sh | Disk and Permission Auditor |
| script4.sh | Log File Analyzer |
| script5.sh | Open Source Manifesto Generator |


## How to Run

### Make all scripts executable
chmod +x script1.sh script2.sh script3.sh script4.sh script5.sh

### Run System Identity Report
./script1.sh

Works on Linux and macOS (auto-detects OS details and uptime format).

### Run Package Inspector
./script2.sh

Checks package status with `rpm`/`dpkg` on Linux and falls back to command-path detection on non-Linux systems.

### Run Disk and Permission Auditor
./script3.sh

### Run Log Analyzer
./script4.sh

By default, `script4.sh` auto-detects a logfile from:
- `/var/log/syslog`
- `/var/log/messages`
- `/var/log/system.log`

You can also pass explicit arguments:
- Linux example: `./script4.sh /var/log/syslog error`
- macOS example: `./script4.sh /var/log/system.log error`

### Run Manifesto Generator
./script5.sh

## SCRIPT IMPLEMENTATION SUMMARY

Script 1: Captures system identity including OS, kernel, uptime, and user environment. Also demonstrates system-level open source licensing context (GPL).

Script 2: Inspects Firefox installation status, retrieves version and package metadata, and explains MPL 2.0 licensing along with the four freedoms.

Script 3: Audits important filesystem directories, showing ownership, permissions, disk usage, and verifies Firefox user configuration directory.

Script 4: Performs keyword-based log analysis across system logs, demonstrating system monitoring even though Firefox logs are primarily user-scoped.

Script 5: Generates a personalized open source manifesto, linking practical scripting with open source philosophy and ethics.

Note: While Script 1 displays a generic GPL license as part of system-level OSS context, Firefox itself is licensed under MPL 2.0 as discussed in Part A.

## Sample Output

### Script 1 Sample Output
```
Hostname: ubuntu
Kernel Version: 5.15.0
```

### Script 3 Sample Output
```
DIRECTORY            OWNER:GROUP          PERMS        SIZE
/etc                 root:root            drwxr-xr-x   12M
```

### Script 4 Sample Output
```
Total matches found: 7
Last 5 matching lines:
```
