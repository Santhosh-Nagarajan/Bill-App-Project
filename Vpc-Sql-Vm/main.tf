
##### VPC NETWORK #########

resource "google_compute_network" "my-network" {
  name                    = var.vpc-name
  auto_create_subnetworks = false
  routing_mode            = var.routing-mode

}

######## Private Subnet ########### 

resource "google_compute_subnetwork" "private_subnet" {
  name                       = "private-${var.vpc-name}"
  network                    = google_compute_network.my-network.self_link
  ip_cidr_range              = var.private-subnet-cidr
  region                     = var.region
  ipv6_access_type           = "EXTERNAL"
  private_ip_google_access   = true
  private_ipv6_google_access = "ENABLE"
  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}
####### Public Subnet ########

resource "google_compute_subnetwork" "public_subnet" {
  name                       = "public-${var.vpc-name}"
  network                    = google_compute_network.my-network.self_link
  ip_cidr_range              = var.public-subnet-cidr
  region                     = var.region
  ipv6_access_type           = "EXTERNAL"
  private_ip_google_access   = false
  private_ipv6_google_access = "ENABLE"
  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}
### Firewall ###

resource "google_compute_firewall" "default" {
  name    = "firewall-${var.vpc-name}"
  network = google_compute_network.my-network.name
  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["3306", "22", "80", "5000"]
  }
  source_ranges = var.firewall-source-range
  target_tags   = ["ssh"]
}



#####################################################################
########################## CLOUD SQL ################################
#####################################################################  

resource "google_sql_database_instance" "instance" {
  name             = var.sql-database-instance-name
  region           = var.region
  database_version = var.database-version

  settings {
    tier = var.tier
    ip_configuration {
      authorized_networks {
        name  = "dashboard-${var.sql-database-instance-name}"
        value = "0.0.0.0/0"
      }
      require_ssl = false
      #private_network = google_compute_network.my-network.self_link
    }

    backup_configuration {
      enabled            = true
      start_time         = "03:00" # Specify the desired backup start time
      binary_log_enabled = true    # Enable binary log backups if needed
    }
  }

}

############# SQL Database #########

resource "google_sql_database" "database" {
  name     = var.database-name
  instance = google_sql_database_instance.instance.name
}

################### User Creation ##################

resource "google_sql_user" "users" {
  name     = var.sql-user
  instance = google_sql_database_instance.instance.id
  password = var.sql-password
}



##############################################################





##################################################################
######################### Compute Engine #########################
##################################################################

resource "google_compute_instance" "default" {
  name         = var.instance-name
  machine_type = var.machine-type
  zone         = var.zone


  tags = ["web", "ssh"]

  boot_disk {
    initialize_params {
      size  = var.size
      image = var.image-name
      labels = {
        my_label = "lable-${var.instance-name}"
      }
    }

  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_vtpm                 = true

  }

  network_interface {
    network    = google_compute_network.my-network.self_link
    subnetwork = google_compute_subnetwork.private_subnet.self_link
    access_config {}
  }

  metadata = {
    block-project-ssh-keys = true

  }


  metadata_startup_script = file("./${var.startup-script}")

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
    email  = var.email

  }
}
####################################################################