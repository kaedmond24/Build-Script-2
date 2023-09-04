#!/bin/bash

##############################################################################################################################
# Created by Kevin Edmond.
#
# 
# 
#
# Please read README.md for full notes on script.
#
###############################################################################################################################


# Display menu for ssh options
# User input for menu choice
echo "Please make a selection using the number option..."
echo " 1: ssh"
echo " 2: scp"
read -p "Enter Number: " USER_SELECTION

# Ask user for remote connection username 
echo "Enter connection username..."
read -p "Enter Username: " CONN_USERNAME

# Ask user for remote connection IP address
echo "Enter connection IP Address..."
read -p "Enter IP Addr: " CONN_IPADDR

# Set remote connection syntax
REMOTE_CONN="$CONN_USERNAME@$CONN_IPADDR"


# Check user ssh selection 
# Initiate ssh or scp connection
if [[ "$USER_SELECTION" -eq "1" ]]
then
        # Start ssh connection process
        echo "starting ssh process..."
        ssh $REMOTE_CONN
elif [[ "$USER_SELECTION" -eq "2" ]]
then
        # Start scp connection process
        echo "starting scp process..."
        # Get connection direction
        echo "Enter connection direction..."
        echo " local: Remote -> Local"
        echo " remote: Local -> Remote"
        read CONN_DIRECTION
        # Get source file path and name
        sleep 1
        echo "Enter source file path and filename (filepath/filename)..."
        echo -p "Enter file path/filename: " SRC_FILE
        read SRC_FILE
        sleep 1
        # Get destination file path and name
        echo "Enter destination path and (optional: filename)..."
        echo -p "Enter file path/filename" DST_FILE
        read DST_FILE
        # Check user file destination input 
        if [[ -z "$DST_FILE" ]]; then
                DST_FILE='/home/"$CONN_USERNAME"/'
        fi
        # Check user connection direction
        if [[ $CONN_DIRECTION -eq "local" ]]
        then
                # Copying from remote to local system
                scp $REMOTE_CONN:$SRC_FILE $DST_FILE
        else
                # Copying from local to remote system
                scp $SRC_FILE $REMOTE_CONN:$DST_FILE
        fi
                echo "File copy has completed."
else
        echo "Please enter a selection of 1 (ssh) or 2 (scp)."
fi

# Notify the user of script completion
sleep 1
echo "This script has finish running."
                                            