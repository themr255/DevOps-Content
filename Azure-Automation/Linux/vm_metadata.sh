#------------------------------------------------------------------------------------------------------------------
# Shell Script to fetch metadata of Linux VM.                                                                     | 
#                                                                                                                 | 
# Pre-requisites -                                                                                                | 
# 1. System Identity should be enabled on your VM (To check - Go to Identity section in VM panel on Azure portal) |
# 2. jq utility should be installed on your VM.                                                                           | 
#                                                                                                                 | 
# Please use below commands to install jq on RHEL/CentOS VM                                                       |
# sudo yum update                                                                                                 |
# sudo yum install jq                                                                                             |
#                                                                                                                 | 
# Please use below commands to install jq on Debian/Fedora VM                                                     |
# sudo apt update                                                                                                 |
# sudo apt install jq                                                                                             |
#------------------------------------------------------------------------------------------------------------------

#!/bin/sh

echo ""
echo "All Metadata of VM: `hostname`"

# Below is the Microsoft API URL to get metadata of your VM
API_URL='http://169.254.169.254/metadata/instance?api-version=2017-08-01'

# Added -s flag in curl to hide output of curl command progress
metadata_output=$(curl -s -H Metadata:true $API_URL | jq .)

echo ""
echo "$metadata_output"

echo ""
echo "Select the top level namespace of above metadata - compute"

# Select the top level namespace of above output - compute
API_URL='http://169.254.169.254/metadata/instance?api-version=2017-08-01'

# Added -s flag in curl to hide output of curl command progress
metadata_output=$(curl -s -H Metadata:true $API_URL | jq -r '.compute')

echo ""
echo "$metadata_output"
