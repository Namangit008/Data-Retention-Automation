# 🧹 DevOps Data Retention Automation Script (Cron + Healthchecks)

This project automates the process of saving log files and deleting old data (retention policy) using **Shell Scripts**, **Cron Jobs**, and **Healthchecks.io** monitoring — all running on an **AWS Ubuntu EC2 instance**.

## 🚀 Features
- ✅ Automatically saves log files hourly
- 🧹 Deletes logs older than a defined number of days (default: 2 days)
- 🕒 Runs both scripts on schedule via cron
- 🔔 Alerts if any job fails using Healthchecks.io integration

## 📁 Project Structure
```bash
data_retention_project/
├── logs/                      # Stores log files
├── save_data.sh              # Simulates data generation
├── delete_old_data.sh        # Deletes files older than N days
├── README.md                 # Documentation
```

## ⚙️ Technologies Used
- **Bash Shell Scripting**
- **Crontab** for scheduling
- **Healthchecks.io** for monitoring
- **AWS EC2 (Ubuntu 22.04)**

## 🧪 How It Works
### `save_data.sh`
- Runs every hour
- Creates a timestamped `.txt` file in `logs/`
- Sends a ping to Healthchecks.io

### `delete_old_data.sh`
- Runs daily at midnight
- Deletes files in `logs/` older than `RETENTION_DAYS`
- Also sends a ping to Healthchecks.io

## 🔁 Crontab Entries
```bash
0 * * * * /home/ubuntu/data_retention_project/save_data.sh >> /home/ubuntu/data_retention_project/save_data.log 2>&1
0 0 * * * /home/ubuntu/data_retention_project/delete_old_data.sh >> /home/ubuntu/data_retention_project/delete_data.log 2>&1
```

## 🩺 Healthchecks.io Integration
- Get a free account at [https://healthchecks.io](https://healthchecks.io)
- Register both scripts as separate checks
- Add `curl` ping inside your script:
```bash
curl -fsS --retry 3 https://hc-ping.com/YOUR-UUID > /dev/null
```

## 👨‍💻 Author
**Naman Jain**  
DevOps Intern | Cloud Enthusiast

## 📎 GitHub Repository
> 📌 [https://github.com/Namangit008/Data-Retention-Automation](https://github.com/Namangit008/Data-Retention-Automation)
