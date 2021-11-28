data "docker_registry_image" "minecraft" {
  name = var.java_version == "latest" ? var.minecraft_image_name : "${var.minecraft_image_name}:${var.java_version}"
}

resource "docker_image" "minecraft_image" {
  name          = data.docker_registry_image.minecraft.name
  pull_triggers = [data.docker_registry_image.minecraft.sha256_digest]
  keep_locally  = true
}
