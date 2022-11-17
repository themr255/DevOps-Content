"""
Python script to fetch metadata of Windows/Linux VM.

Pre-requisites -
--------------------
1. System Identity should be enabled on your VM (To check - Go to Identity section in VM panel on Azure portal)

"""

import requests

headers={"Metadata": "true"}

session = requests.session()
session.trust_env = False

response = session.get('http://169.254.169.254/metadata/instance?api-version=2017-08-01', headers = headers)

vm_metadata = response.json()

print("Metadata of VM -\n")

print(vm_metadata)

session.close()
