#!/bin/bash -e

# ASCII Art
cat << "EOF"
                          .:=+*********************+=:.                          
                         .+***************************+.                         
                        .+*****************************+.                        
                        .*******************************.                        
                        .*******************************.                        
                        .*******************************.                        
                        .*******************************.                        
                        .*******************************.                        
                        .*******************************.                        
   ..                   :*******************************:                   ..   
.-++++-.               :***=::::=+*************+=::::=***:               .-++++-.
=*=::-*=:::::::::.    .**+: .::. .=***********=. .::. :+**.    .:::::::::=*-::=*=
*+    =***********:   -**- .+***- .***********. -***+. -**-   :***********=    +*
=*=::=*=-------+**:   -**: .****- .***********. -****. :**-   :**+-------=*=::=*=
 :=++=:.       -**:   :**+: .--. .=***********=. .--. :+**:   :**-       .:=++=: 
               -**:    :***=:..:-+*************+-:..:=***:    :**-               
               -**:     .=*****************************=.     :**-               
               -**:       .:***+=***+=+***+=+***=+***:.       :**-               
               -**:.........+*+. +**. -***- .**+ .+*+.........:**-               
               =***+++++++++**+. +**. -***- .**+ .+**+++++++++***=               
               :++++++++++++++-. +**. -***- .**+ .-++++++++++++++:               
                                 +**. -***- .**+                                 
                      .-------===+**. -***- .**+===-------.                      
                      :************+. -***- .+************:                      
                      :**=..........  -***-  ..........=**:                      
                      :**=            -***-            =**:                      
                     :=**+-.        .:+***+:.        .-+**=:                     
                    :*+-:=*+.      .=*=:::=*=.      .+*=:-+*:                    
                   .+*.   =#:      .*+     +*.      :#=   .*+.                   
                    -*=:.-*+.      .+*-.:.-*+.      .+*-.:=*-                    
                    .-+**+=.        .-+***+-.        .=+**+-.                    
EOF
echo "Welcome to AutoGPT, This script will guide you through a standard setup. Sudo is required for docker install"
echo "Starting setup process..."

# Optional system update with warning
echo "Warning: Upgrading packages may affect other applications in non-fresh Linux/WSL environments."
echo "It's recommended to update only in fresh Linux/WSL environments."
read -p "Do you want to update and upgrade the system packages? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo apt update
    sudo apt upgrade
fi

# Install necessary dependencies
sudo apt install apt-transport-https ca-certificates curl software-properties-common git python3 python3-pip -y

# Install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER

# Install Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt-get install ./google-chrome-stable_current_amd64.deb

# Install Poetry
curl -sSL https://install.python-poetry.org | python3 -

# Check if Poetry path is already in PATH
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
    export PATH="$HOME/.local/bin:$PATH"
fi

# Clone and set up AutoGPT
git clone https://github.com/Significant-Gravitas/AutoGPT.git
cd AutoGPT/autogpts/autogpt
./setup

# Prompt for OpenAI API key and update .env file
echo "Enter your OpenAI API key:"
read -r openai_api_key
sed -i "s/your-openai-api-key/${openai_api_key}/" .env.template
mv .env.template .env

# Run AutoGPT serve command
./autogpt.sh serve

echo "AutoGPT server is running."
