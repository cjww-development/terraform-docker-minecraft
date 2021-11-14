output "minecraft_container_hostname" {
  value       = docker_container.minecraft.hostname
  description = "The hostname assigned to the container after deploy"
}

output "minecraft_container_networks" {
  value       = docker_container.minecraft.networks
  description = "The networks associated with the deployed container"
}

output "minecraft_container_ip" {
  value       = docker_container.minecraft.ip_address
  description = "The ip address of the deployed container"
}

output "minecraft_container_entrypoint" {
  value       = docker_container.minecraft.entrypoint
  description = "List of the entrypoints for the deployed container"
}

output "minecraft_container_id" {
  value       = docker_container.minecraft.id
  description = "The id of the deployed container"
}
