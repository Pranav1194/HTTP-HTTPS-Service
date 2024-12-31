# S3 List Bucket Content Service(local-server)
This project implements a simple HTTPS service that interacts with AWS S3 to list the content of a specified S3 bucket. It provides an API to list the contents of the top-level bucket or a specific directory.
## Prerequisitess
- AWS account
-  Python
-  VS Code/Terminal (optional)
-  ssl Certificate and key
## Steps for Setup
- clone the repository
- cd http-service-python-app
- install python
- command to install all required packages "pip install boto3 flask botocore pyopenssl"
- command to run code "python app.py"
- this code needs ssl certificate and key
- Hit this to get response"https://localhost:5000/list-bucket-content" 
# configuration for terrafrom 
This project implements a simple HTTP service using IAAC Terraform that interacts with AWS S3 to list the content of a specified S3 bucket. It provides an API to list the contents of the top-level bucket or a specific directory.
## Prerequisitess
- AWS account
-  Python
-  terraform
## steps for setup
- clone the repository
- download terraform
- run command "terraform init" to initialize and to download dependencies eg provider
- run command "terraform plan" this command will give an overview of an infracture and what resources are going to create
- -run command "terraform apply " this command starts the terraform and it does creates resources that are mantioned in main.tf file
- main.tf = This file contain resources ,user data template and networking (sg)
  ## challenges faced during project
- when i was working on terraform i was not able to configure ssl to secure it using https but later i discovered that how i will do it using terraform
- when i hit the ip http://100.26.144.242:5000/list-bucket-content/nonexisting at very first i didnt git any response from the server to troubleshoot this problem i ssh in to server and checked the pyhton is installed and it is running later i got to know my 5000 port is not opened
- while working with local https service i had my ssl certificate and key but they where in different directory and my project was in different directory so i configured them in same directory where my app.py was
  ## Reference
  OPEN SOURCE

