#!/bin/bash

# Define the new string
new_string='MEASUREMENT_FOLDER = "anotherstring"'

# Replace the line using sed
sed -i '/MEASUREMENT_FOLDER =/c\'"$new_string" file.toml
