#!/bin/bash

# Steps 3-4: Create a group called "developers", users "developer" and "tester", and add them to the group
sudo groupadd developers
sudo useradd -m -G developers developer
sudo useradd -m -G developers tester

# Step 5: Create a shared folder named "work" in /home
sudo mkdir /home/work
sudo chown :developers /home/work
sudo chmod 770 /home/work # Owner and group members can read, write, and execute files in this directory

# Step 6: Set permissions so both users can create and edit files
sudo chmod g+s /home/work # Enable group inheritance for new files
sudo chmod g+t /home/work # Only file owners can delete their files
