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
    "ALLOW_NETHER=${var.allow_nether}",
    "ANNOUNCE_PLAYER_ACHIEVEMENTS=${var.announce_player_achievements}",
    "ENABLE_ROLLING_LOGS=${var.enable_rolling_logs}",
    "EULA=true",
    "DIFFICULTY=${var.difficulty}",
    "ENABLE_AUTOPAUSE=${var.enable_autopause}",
    "FORCE_GAMEMODE=${var.force_gamemode}",
    "GENERATE_STRUCTURES=${var.generate_structures}",
    "LEVEL_TYPE=${var.level_type}",
    "MAX_BUILD_HEIGHT=${var.max_build_height}",
    "MAX_PLAYERS=${var.max_player_count}",
    "MAX_WORLD_SIZE=${var.max_world_size}",
    "MEMORY=${var.memory_limit}",
    "MODE=${var.game_mode}",
    "MOTD=${var.message_of_the_day}",
    "OPS=${join(",", var.admins)}",
    "OVERRIDE_SERVER_PROPERTIES=TRUE",
    "PVP=${var.pvp}",
    "SEED=${var.level_seed}",
    "SPAWN_ANIMALS=${var.spawn_animals}",
    "SPAWN_MONSTERS=${var.spawn_monsters}",
    "SPAWN_NPCS=${var.spawn_npcs}",
    "TYPE=${var.server_type}",
    "VERSION=${var.minecraft_version}",
    "VIEW_DISTANCE=${var.view_distance}",
    "WHITELIST=${join(",", var.player_whitelist)}"
  ]
}
