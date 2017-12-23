# Corky's Kettle Corn Website Re-Design

## Project Overview
Corky's Kettle Corn is a local, gourmet shop that sells at The Fair Grounds in Raleigh, NC. Their product can be found in stores across the Triangle. Custom orders are available online. They are a family owned and operated business that believes in superior quality and fair prices.

### Objectives
- Update existing website layout to a more modern design
- Attractively display product with new photos and descriptions
- Increase revenue

### The Project Team
* **Victoria Coleman**
    * *Product Owner, Developer, Designer*
* **Tyson Denio**
    * *Backend Developer*
* **Bryan Coleman**
    * *Developer, Consultant*

### Research
Victoria Coleman led the research and analysis of similar sites that feature gourmet, family-owned, and handmade goods. Her studies led to an updated color scheme, logo, and layout for the site. Victoria's background in photography and visual arts were perfect for the redesign of this site.

### Wireframing and Mockups
All design images and processes can be found in the design folder.

## Tools

### Bootstrap
Used a layout called Modern Business to quickly scaffold the website.

### Sketch
A mockup tool to plan, integrate, and develop layouts.

### Canva
Visual template creation used to display SWOT Analysis, style guides, and sketches.

### ZenCart
Ecommerce Customer Management System

## Development Environment

### Vagrant
The Zencart developers have released a Vagrant file and provisioning scripts to make running local zencart instances simple.  This project is leverages Habitat for local development.  The original Habitat project can be found at https://github.com/zencart/habitat.

1. Ensure Vagrant is installed on the development machine.  This included installing VirtualBox or some other Vagrant-compatable hypervisor.

2. From the vagrant directory run the ``vagrant up`` command.  This will map our local Corkys site into the VM and serve it on an Apache server listening for corkys.local.

3. Update the development machine's hosts file to point corkys.local to 172.22.22.22.

### Importing database
Phpmyadmin is available for database administration at corkys.local/phpmyadmin.  Default login for habitat VM's is username: `zencart` and password: `zencart`.  There is already a database named `zencart`, import the database dump into the existing `zencart` database.
