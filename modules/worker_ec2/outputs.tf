output "private_ip" {
  description = "Private of the boundary worker EC2"
  value       = module.ec2_boundary_worker.private_ip
}

output "pub_ip" {
  description = "Pub IP of the boundary worker EC2"
  value       = module.ec2_boundary_worker.public_ip
}
