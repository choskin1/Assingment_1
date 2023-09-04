# Study Group Repository README
Welcome to the Study Group repository. This guide aims to provide a comprehensive overview of the codebase to help new developers get up to speed quickly.

## Overview
This repository contains a web application that alows users to sign up for an account. A user may join as many study groups as they want and also create study groups for others to join. The purppose of this app is for users to share files and communicate through virual meetings about topics within thier selected group.

# Virtual Machines
## Backend Server (VM Name: "backend"):
- Hostname: backend-server
- IP Address: 192.168.56.22
- Purpose: This VM is set up as a backend server. It has its own private network and a synced folder configuration. The folder is synced from the host to the /vagrant directory on the VM with specific permissions.
- Provisioning: The VM is provisioned using a shell script named setup-backend.sh located in the vm_scripts directory. This script contains instructions on setting up the mysql data base and connecting it to run in a flask environment on the frontend.
Frontend Server (VM Name: "frontend"):

## Frontend Server (VMName: "frontend"):
- Hostname: frontend-server
- IP Address: 192.168.56.21
- Port Forwarding: The VM has port forwarding configured from guest port 5001 to host port 5001.
- Purpose: This VM is set up as a frontend server. It has both a private network and port forwarding configuration. Like the backend server, it also has a synced folder configuration.
- Provisioning: The VM is provisioned using a shell script named setup-frontend.sh located in the vm_scripts directory. This script contains setup instructions specific to the frontend server.

## Media Server (VM Name: "media"):
- Media Server (VMName: "media"):
- Hostname: media-server
- IP Address: 192.168.56.23
- Purpose: This VM seems to be dedicated to media-related tasks. It has its own private network and a synced folder configuration similar to the other VMs.
- Provisioning: The VM is provisioned using a shell script named setup-media.sh located in the vm_scripts directory. This script likely contains setup instructions specific to the media server.

## Repository Structure

- Vagrantfile: This file is used to set up a virtual environment using Vagrant. It defines all threevirtual machine's configurations.

- Backend Server (VM Name: "backend"):
    - setup-backend.sh: The provisioning script used to set up the backend virtual machine. Creates an SQL data base and links to front       end
    - setup-database.sql: This file contains the data base schema for the backend, it creates 3 different tables to handle users and          study groups
 - Frontend Server (VMName: "frontend"):
    - templates: These are the html templates that the routes in main_app.py point to, these pages are displayed to the user                - dashboard.html: The dashboard view for users.
    - host_meeting.html: A view to host a meeting.
    - index.html: The main landing page or homepage.
    - login.html: The login page for users.
    - register.html: The user registration page.
    - session.html: A view related to user sessions.
    - upload.html: A page to upload files.
    - view_files.html: A view to see uploaded files.
    - view_studygroups.html: A view to see study groups.
    - setup-frontend.sh: The provisioning script used to set up the frontend virtual machine. Uses flask to deploy a web server on            port 5001
    - main_app.py: The main application file written in Python. Contains the primary logic and routes for the web                             application.
  - Media Server (VM Name: "media"):
      - setup-media.sh: The provisioning script used to set up the media server. This script intialises a Apache server to host an end          point for file uploads and virtual communication through the use of jitsi
      - upload.html: is an html page that is rendering on the web apache server
      - upload.php: is the php script that recieves and displays files
   


## Getting Started

- Clone the repository locally on your computer
- Make sure vagrant is installed
- Cd into the cloned repositry and run vagrant up
- Wait unitl all Virutal Machines boot and then head to http://127.0.0.1:5001


## Conclusion
This repository contains a web application with functionalities related to meetings, user sessions, and file uploads. New developers should focus on main_app.py for the main application logic and the templates directory for the user interface. Ensure to set up the environment and database as mentioned in the "Getting Started" section.




