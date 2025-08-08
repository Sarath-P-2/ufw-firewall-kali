# Firewall Setup and Traffic Filtering (UFW on Linux)

## Objective
Configure and test basic firewall rules using UFW (Uncomplicated Firewall) on Kali Linux to allow or block specific network traffic.

---

##  Tools Used
- **Operating System**: Kali Linux
- **Firewall**: UFW (Uncomplicated Firewall)

---

##  Steps Performed

### 1. Checked UFW Installation Status
```bash
sudo ufw status
```

### 2. Installed and Enabled UFW
```bash
sudo apt install ufw -y
sudo ufw enable
```

### 3. Listed Current Firewall Rules
```bash
sudo ufw status numbered
```

### 4. Blocked Telnet (Port 23)
```bash
sudo ufw deny 23
```

### 5. Allowed SSH (Port 22)
```bash
sudo ufw allow 22
```

### 6. Tested Telnet Block
```bash
telnet 127.0.0.1 23
```
> Result: Connection denied — Telnet is successfully blocked.

### 7. Added Common Firewall Rules
```bash
sudo ufw allow 80      # Allow HTTP
sudo ufw allow 443     # Allow HTTPS
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

### 8. Removed Test Rule (Port 23) to Restore State
```bash
sudo ufw status numbered
sudo ufw delete <rule_number>
```

---

## Interactive UFW Configuration Script

To simplify setting rules, this repo includes a Bash script: `setup-firewall.sh`.

It asks for 4 inputs:
1. Ports to BLOCK (e.g., 23,25)
2. Ports to ALLOW (e.g., 22,80,443)
3. IPs to BLOCK (e.g., 192.168.1.100)
4. IPs to ALLOW (e.g., 192.168.1.101)

###  How to Use
```bash
chmod +x setup-firewall.sh
./setup-firewall.sh
```

Press **Enter** to skip any input. The script will apply your firewall rules and show the final `ufw status`.

---

##  How to Use This Script (For Others)

The `setup-firewall.sh` script helps configure firewall rules using UFW interactively. It's ideal for quick setup or learning.

###  Prerequisites
- Debian-based Linux OS (Kali, Ubuntu, etc.)
- `ufw` installed 
- `sudo` privileges

###  Usage Steps

1. **Copy the script** to your Linux machine and save it as:
```
setup-firewall.sh
```

2. **Make it executable**
```bash
chmod +x setup-firewall.sh
```

3. **Run the script**
```bash
./setup-firewall.sh
```

4. **Enter your firewall preferences** when prompted:
   - Ports to **block** (e.g., `23,25`)
   - Ports to **allow** (e.g., `22,80,443`)
   - IPs to **block** (e.g., `192.168.1.100`)
   - IPs to **allow** (e.g., `192.168.1.101`)

Press **Enter** to skip any field.

### Example Interaction

[image](script_usage.png)

This script simplifies applying common UFW rules without needing to remember each command.

---
