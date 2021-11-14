output "jenkins_container_hostname" {
  value       = docker_container.jenkins.hostname
  description = "The hostname assigned to the container after deploy"
}

output "jenkins_container_networks" {
  value       = docker_container.jenkins.networks
  description = "The networks associated with the deployed container"
}

output "jenkins_container_ip" {
  value       = docker_container.jenkins.ip_address
  description = "The ip address of the deployed container"
}

output "jenkins_container_entrypoint" {
  value       = docker_container.jenkins.entrypoint
  description = "List of the entrypoints for the deployed container"
}

output "jenkins_container_id" {
  value       = docker_container.jenkins.id
  description = "The id of the deployed container"
}
