data "docker_registry_image" "minecraft" {
  name = var.minecraft_image_name
}

resource "docker_image" "minecraft_image" {
  name          = data.docker_registry_image.minecraft.name
  pull_triggers = [data.docker_registry_image.minecraft.sha256_digest]
  keep_locally  = true
}
