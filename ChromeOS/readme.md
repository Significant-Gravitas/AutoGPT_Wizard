# ChromeOS Wizard Script

This folder contains the `chromewizard.sh` Bash script, designed to automate the setup of various tools and dependencies on Chrome OS systems, including Docker and Poetry, and to configure AutoGPT.

## Enabling Linux on Chrome OS

Before running the script, ensure that the Linux environment is enabled on your Chromebook. To do this, follow these steps:

1. **Open the Settings app** on your Chromebook.
2. **Click on “Advanced”** to expand the advanced settings section.
3. **Select “Developers”**.
4. **Under the “Linux development environment (Beta)”**, click on “Turn On”.
5. **Follow the on-screen instructions** to install the Linux environment.

## Downloading the Script

1. **Navigate to the GitHub Repository**: Go to the `chromewizard.sh` file in the repository.

2. **Download the Raw Script**:
   - Click on the `chromeoswizard.sh` file.
   - Click the "Raw" button near the top right of the file content.
   - Right-click on the page and select "Save as...". Choose your Linux folder as the destination and save the file.

## Running the Script

1. **Open the Linux Terminal** on your Chromebook.

2. **Make the Script Executable**:
   ```bash
   chmod +x ~/chromeoswizard.sh
   ```

3. **Run the Script**:
   ```bash
   ~/chromeoswizard.sh
   ```

## Script Features

- **System Update and Upgrade**: Optional updating and upgrading of system packages.
- **Dependency Installation**: Installs necessary dependencies for running AutoGPT.
- **Docker Installation**: Sets up Docker.
- **Poetry Installation**: Installs Poetry for Python dependency management.
- **AutoGPT Setup**: Automates the cloning and configuration of AutoGPT.

## User Interaction

The script contains interactive prompts. Be prepared to provide inputs and make selections during the script execution.
