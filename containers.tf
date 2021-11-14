resource "docker_container" "minecraft" {
  name  = var.minecraft_container_name
  image = docker_image.minecraft_image.latest

  ports {
    internal = 25565
    external = var.server_port
    ip       = var.server_interface_bind
  }

  ports {
    internal = 25575
    external = var.rcon_port
    ip       = var.rcon_interface_bind
  }

  volumes {
    container_path = "/data"
    host_path      = docker_volume.minecraft_volume.mountpoint
    read_only      = false
  }

  env = [
    "EULA=true",
    "MOTD=${var.message_of_the_day}",
    "DIFFICULTY=${var.difficulty}",
    "WHITELIST=${join(",", var.player_whitelist)}",
    "OPS=${join(",", var.admins)}",
    "MAX_PLAYERS=${var.max_player_count}",
    "MAX_WORLD_SIZE=${var.max_world_size}",
    "ALLOW_NETHER=${var.allow_nether}",
    "ANNOUNCE_PLAYER_ACHIEVEMENTS=${var.announce_player_achievements}",
    "FORCE_GAMEMODE=${var.force_gamemode}",
    "GENERATE_STRUCTURES=${var.generate_structures}",
    "MAX_BUILD_HEIGHT=${var.max_build_height}",
    "SPAWN_ANIMALS=${var.spawn_animals}",
    "SPAWN_MONSTERS=${var.spawn_monsters}",
    "SPAWN_NPCS=${var.spawn_npcs}",
    "VIEW_DISTANCE=${var.view_distance}",
    "SEED=${var.level_seed}",
    "MODE=${var.game_mode}",
    "PVP=${var.pvp}",
    "LEVEL_TYPE=${var.level_type}",
    "TYPE=${var.server_type}"
  ]
}
