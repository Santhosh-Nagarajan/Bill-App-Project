project-id = "playground-s-11-b3e4982f"

region = "us-central1"

zone = "us-central1-a"

credential = "playground-s-11-b3e4982f-342c5b787af8.json"

vpc-name = "dashboard-vpc"

routing-mode = "REGIONAL"

private-subnet-cidr = "10.10.1.0/24"

public-subnet-cidr = "10.10.2.0/24"

firewall-source-range = ["0.0.0.0/0"]


####################################################################
####################### CLOUD SQL ##################################
####################################################################

sql-database-instance-name = "my-database-instance"

database-version = "MYSQL_8_0"

tier = "db-n1-standard-1"

database-name = "dashboard"

sql-user = "root"

sql-password = "root"

##################################################################
####################### COMPUTE ENGINE ################################
##################################################################

instance-name = "myinstance"

machine-type = "e2-medium"


size = "10"

image-name = "ubuntu-os-cloud/ubuntu-2004-lts"

startup-script = "test.sh"

email = "cli-service-account-1@playground-s-11-b3e4982f.iam.gserviceaccount.com"



