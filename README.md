# S3 List Bucket Content Service(local-server)
This project implements a simple HTTPS service that interacts with AWS S3 to list the content of a specified S3 bucket. It provides an API to list the contents of the top-level bucket or a specific directory.
## Setup Instructions
- AWS account
-  Python
-  VS Code (optional)
## Steps for Setup
- clone the repository
- cd http-service-python-app
- install python
- command to install all required packages "pip install boto3 flask botocore pyopenssl"
- command to run code "python app.py"
- this code needs ssl certificate and key
- Hit this to get response"https://localhost:5000/list-bucket-content" 
