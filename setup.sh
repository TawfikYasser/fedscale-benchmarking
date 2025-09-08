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
