# FedScale Project Setup & Run Guide

This README documents the setup and configuration steps to run **FedScale** locally or in cluster mode.  
Reference: [FedScale GitHub](https://github.com/SymbioticLab/FedScale)

---

## 🚀 Setup

### 1. Clone and prepare environment
```bash
git clone https://github.com/SymbioticLab/FedScale.git
cd FedScale
```

### 2. Create `setup.sh`
Create a `setup.sh` file with the following contents:

```bash
cd FedScale

# Please replace ~/.bashrc with ~/.bash_profile for MacOS
FEDSCALE_HOME=$(pwd)
echo export FEDSCALE_HOME=$(pwd) >> ~/.bashrc 
echo alias fedscale=\'bash $FEDSCALE_HOME/fedscale.sh\' >> ~/.bashrc 
conda init bash
. ~/.bashrc

# Update package list
sudo apt update

# Install OpenSSH server
sudo apt install -y openssh-server

# Start the SSH service
sudo systemctl start ssh

# Enable SSH to start automatically on boot
sudo systemctl enable ssh

# Check if SSH is now running
sudo systemctl status ssh

# Create and activate FedScale environment
conda env create -f environment.yml
conda activate fedscale
pip install -e .
```

### 3. Run the setup
```bash
bash setup.sh
```

---

## ⚙️ Configuration

Modify your **config file** (e.g., `benchmark/configs/femnist/conf.yml`) before running:

```yaml
num_participants: 10
rounds: 500
use_cuda: False
```

---

## 📂 Dataset Download

FedScale provides an integrated dataset downloader. Use either:

```bash
fedscale dataset download [dataset_name]
```
or
```bash
bash download.sh download [dataset_name]
```

---

## ▶️ Running Experiments

You can run in **cluster mode** or **local test mode**:

### Cluster Mode
```bash
fedscale driver submit benchmark/configs/femnist/conf.yml
```
- To stop the job:
  ```bash
  fedscale driver stop <job_name>
  ```
  (`job_name` is defined inside your config file.)

### Local Test Mode
```bash
python driver.py start <conf>
```

---

## ✅ Summary

1. Setup environment with `setup.sh`.  
2. Edit configs (`num_participants=10`, `rounds=500`, `use_cuda=False`).  
3. Download dataset.  
4. Run with either cluster mode or local mode.  
