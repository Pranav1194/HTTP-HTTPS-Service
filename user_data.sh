#!/bin/bash
# Update and install required packages
yum update -y
yum install -y python3 python3-pip
pip3 install flask boto3

# Write the Python application to a file
cat <<'EOF' > /home/ec2-user/app.py
import boto3
from flask import Flask, jsonify

app = Flask(__name__)

# Initialize the S3 client using provided keys
s3 = boto3.client('s3', aws_access_key_id='${s3_access_key}', aws_secret_access_key='${s3_secret_key}')
BUCKET_NAME = '${bucket_name}'

@app.route('/list-bucket-content', defaults={'path': ''})
@app.route('/list-bucket-content/<path:path>')
def list_bucket_content(path):
    try:
        # Ensure the path ends with a slash (to simulate a directory)
        if path and not path.endswith('/'):
            path += '/'

        # List objects in the bucket with the specified prefix (path) and delimiter '/'
        response = s3.list_objects_v2(Bucket=BUCKET_NAME, Prefix=path, Delimiter='/')

        # Handle cases where the path doesn't exist (no objects found)
        if 'Contents' not in response and 'CommonPrefixes' not in response:
            return jsonify({"error": f"Path '{path}' does not exist or has no content."}), 404

        # Collect the content (directories or files)
        content = []
        if 'CommonPrefixes' in response:
            content.extend([prefix['Prefix'][:-1] for prefix in response['CommonPrefixes']])
        if 'Contents' in response:
            content.extend([obj['Key'].split('/')[-1] for obj in response['Contents'] if obj['Key'] != path])

        return jsonify({"content": content})

    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
EOF

# Start the Python application
nohup python3 /home/ec2-user/app.py &
