#!/bin/bash
config_file="$HOME/.ssh/config"

# Check if file exists
if [ ! -f "${config_file}" ]; then
    echo "SSH config file not found."
    exit 1
fi

# Read configuration and extract hostnames, ignoring comment lines and blank lines.
hosts=()
while IFS= read -r line; do
    hosts+=("$line")
done < <(grep -E "^\s*Host\s+" "${config_file}" | grep -v "^\s*#" | awk '{print $2}')

# Check Available SSH connections
if [ ${#hosts[@]} -eq 0 ]; then
    echo "No hosts found in SSH config file."
    exit 1
fi

select_host() {
    echo "Available SSH connections:"
    PS3=": "
    COLUMNS=1
    select host in "${hosts[@]}"; do
        if [ -n "$host" ]; then
            echo "Connecting to $host..."
            tssh "$host"
            break
        else
            echo "Invalid selection. Please try again."
        fi
    done
}

# Check input arguments
if [ "$#" -eq 0 ]; then
    select_host
elif [ "$#" -eq 1 ]; then

    index=$1
    if [[ $index -ge 1 && $index -le ${#hosts[@]} ]]; then
        host=${hosts[$((index - 1))]}
        echo "Connecting to $host..."
        tssh "$host"
    else
        echo "Invalid selection. Please try again."
        exit 1
    fi
else
    echo "Usage: sl [index]"
    exit 1
fi
