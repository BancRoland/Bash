#!/bin/bash

# Path to the TOML file
toml_file="config.toml"

# Extract values using grep, cut, and sed
host=$(grep 'host' "$toml_file" | cut -d '"' -f 2)
port=$(grep 'port' "$toml_file" | cut -d ' ' -f 3)
username=$(grep 'username' "$toml_file" | cut -d '"' -f 2)
password=$(grep 'password' "$toml_file" | cut -d '"' -f 2)

# Use the extracted values in your script
echo "Host: $host"
echo "Port: $port"
echo "Username: $username"
echo "Password: $password"
