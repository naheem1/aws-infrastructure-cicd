environment         = "staging"
instance_type      = "t3.micro"
db_instance_class  = "db.t3.micro"
min_size           = 1
max_size           = 2
desired_capacity   = 1
multi_az           = false

tags = {
  Environment = "staging"
  ManagedBy   = "terraform"
  Project     = "web-app"
}