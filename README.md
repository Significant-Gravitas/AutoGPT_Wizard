## AutoGPT Installation Guide on WSL2 with Ubuntu

This guide provides step-by-step instructions for setting up AutoGPT on Windows using the Windows Subsystem for Linux (WSL2) and Ubuntu.

### Steps for Installation

#### 1. Install WSL & Ubuntu from the Windows Store
- Open the **Microsoft Store** on your Windows PC.
- Search for and install **Windows Subsystem for Linux**.
- Then, search for "Ubuntu" and select the standard version to install.

#### 2. Initialize Ubuntu
- Launch Ubuntu from the Start menu.
- The first launch will finalize the setup. You'll be prompted to create a user account and password.

#### 3. Download The Raw wizard.sh File
- Navigate to [AGPT_WIZARD repository](https://github.com/NeonN3mesis/AGPT_WIZARD/blob/main/wizard.sh) and download the raw `wizard.sh` file.
- Right-click and copy the file.

#### 4. Access Ubuntu's Home Directory in File Explorer
- In the Ubuntu terminal, type `explorer.exe .` (The second . is very important)
- This command opens Windows File Explorer in the Ubuntu home directory.

#### 5. Prepare the Installation Script
- In the Ubuntu home directory (using Windows File Explorer), paste the `wizard.sh` script file.

#### 6. Execute the Script
- Return to the Ubuntu terminal and execute the following commands:
```bash
chmod +x wizard.sh
./wizard.sh
```
- This will make the script executable and then run it.
- When prompted, answer the questions.

#### 7. Enter Your API Key
- During the script execution, you'll be prompted to enter your OpenAI API key. Please enter it when prompted.
- [Instructions for getting a paid API Key](https://docs.agpt.co/autogpt/setup/#getting-an-openai-api-key)

#### 8. AutoGPT Runs
- After the installation process completes, AutoGPT will automatically start running.

### By following these steps, you'll have AutoGPT up and running on your Windows machine using WSL2 and Ubuntu.


#### License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/NeonN3mesis/AGPT_WIZARD/blob/main/LICENSE) file for details.
