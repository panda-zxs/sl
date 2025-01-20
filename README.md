# SSH Connection Tool
# Overview
This script provides a simple way to manage SSH connections from a centralized configuration file (~/.ssh/config). It allows you to list available connections, select a connection to establish, and connect to a specific host using the tssh command.

# Usage
Download&Install

```bash
wget -O ~/.local/bin/sl https://raw.githubusercontent.com/panda-zxs/sl/master/sl.sh && sudo chmod +x ~/.local/bin/sl
```
List Available Connections
To list available SSH connections, simply run the script without any arguments:

```bash
# CopyInsert in Terminal
./sl.sh
# This will display a list of available connections and prompt you to select one.
```
Connect to a Specific Host
To connect to a specific host, you can pass the index of the host as an argument:

```bash
# CopyInsert in Terminal
./sl.sh 1
# This will connect to the first host in the list.
```
## Requirements
Bash 4.0 or later
tssh command (not included in this repository)
Configuration
The script reads its configuration from the ~/.ssh/config file. This file should contain a list of hosts in the format:

## Code Structure
The script consists of the following sections:

1. Configuration: Sets the path to the SSH configuration file.
2. File Existence Check: Checks if the configuration file exists.
3. Host Extraction: Reads the configuration file and extracts hostnames, ignoring comment lines and blank lines.
4. Connection Selection: Prompts the user to select a connection or connects to a specific host if an index is provided.
5. Input Validation: Checks the number of input arguments and displays usage information if necessary.
## License
This script is released under the MIT License. See LICENSE for details.
