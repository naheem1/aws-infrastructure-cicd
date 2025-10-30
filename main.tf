terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = "${var.project_name}-test-bucket-${var.environment}-v2"

  tags = {
    Name        = "${var.project_name}-bucket"
    Environment = var.environment
    ManagedBy   = "Terraform"
    TestTag     = "Step4Demo"
    AnotherTag  = "TestingPlanComments"
  }
}

resource "aws_s3_bucket_versioning" "test_bucket" {
  bucket = aws_s3_bucket.test_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
} 

resource "aws_launch_template" "app" {
  name_prefix   = "${var.environment}-app-"
  image_id      = "ami-xxxxx"  # Your AMI
  instance_type = var.instance_type  # <-- USING VARIABLE
  
  # ... rest of your config
  
  tag_specifications {
    resource_type = "instance"
    tags = merge(
      var.tags,  # <-- USING VARIABLE
      {
        Name = "${var.environment}-app-instance"
      }
    )
  }
}

resource "aws_autoscaling_group" "app" {
  name                = "${var.environment}-app-asg"
  min_size            = var.min_size      # <-- USING VARIABLE
  max_size            = var.max_size      # <-- USING VARIABLE
  desired_capacity    = var.desired_size  # <-- USING VARIABLE
  
  # ... rest of your config
  
  tag {
    key                 = "Environment"
    value               = var.environment
    propagate_at_launch = true
  }
}

resource "aws_db_instance" "main" {
  identifier           = "${var.environment}-db"
  instance_class       = var.db_instance_class  # <-- USING VARIABLE
  multi_az             = var.db_multi_az        # <-- USING VARIABLE
  backup_retention_period = var.db_backup_retention  # <-- USING VARIABLE
  
  # ... rest of your config
  
  tags = merge(
    var.tags,
    {
      Name = "${var.environment}-database"
    }
  )
}


