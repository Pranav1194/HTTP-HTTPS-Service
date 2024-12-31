variable "s3_access_key" {
  description = "Access key for S3"
  type        = string
  sensitive   = true
}

variable "s3_secret_key" {
  description = "Secret key for S3"
  type        = string
  sensitive   = true
}

variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_pair_name" {
  description = "Key pair name for EC2 SSH access"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for EC2 instance"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for EC2 instance"
  type        = string
}
variable "aws_access_key" {
  description = "The AWS Access Key ID"
  type        = string
}

variable "aws_secret_key" {
  description = "The AWS Secret Access Key"
  type        = string
}
