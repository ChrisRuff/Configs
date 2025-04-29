#!/bin/bash

# Get the virus name and file path from the command-line arguments
VIRUS_NAME=$1
FILE_PATH=$2

# Send a desktop notification using dunstify
dunstify -u critical "Virus Detected!" "A virus named '$VIRUS_NAME' was detected in the file: $FILE_PATH"
