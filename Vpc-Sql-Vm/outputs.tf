output "VPC-Id" {
  value = google_compute_network.my-network.id
}

output "Public-Subnet-Id" {
  value = google_compute_subnetwork.public_subnet.id
}

output "Private-Subnet_Id" {
  value = google_compute_subnetwork.public_subnet.id
}

output "Sql-Id" {
  value = google_sql_database_instance.instance.id
}

output "Sql-Public-IP" {
  value = google_sql_database_instance.instance.public_ip_address
}

output "VM-IP" {
  value = google_compute_instance.default.network_interface.0.network_ip
}