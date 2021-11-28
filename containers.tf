resource "docker_container" "minecraft" {
  name  = var.minecraft_container_name
  image = docker_image.minecraft_image.latest

  restart = var.restart_policy

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

  env = concat(
    [
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
      "USE_AIKAR_FLAGS=${var.use_aikars_flags}",
      "USE_LARGE_PAGES=${tonumber(regex("[0-9\\(\\)]+", var.memory_limit)) >= 12 && regex("[gGmMkK]", var.memory_limit) == "G"}",
      "VERSION=${var.minecraft_version}",
      "VIEW_DISTANCE=${var.view_distance}",
      "WHITELIST=${join(",", var.player_whitelist)}"
    ],
    var.other_environment_variables
  )
}
