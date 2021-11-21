variable "docker_host" {
  type        = string
  description = "The host where docker resides"
}

variable "minecraft_volume_name" {
  type        = string
  description = "The name of the docker volume to be used by the Minecraft server container"
}

variable "minecraft_network_name" {
  type        = string
  description = "The name of the docker network that the Minecraft server container will be connected to"
}

variable "minecraft_image_name" {
  type        = string
  description = "The name of the Minecraft server docker image that should be pulled"
}

variable "minecraft_container_name" {
  type        = string
  description = "The name of the Minecraft server container to be created"
}

variable "server_port" {
  type        = number
  description = "The host port number the internal port 25565 will map to"
  default     = 25565
}

variable "server_interface_bind" {
  type        = string
  description = "The network interface that port 25565 will bind to"
  default     = "0.0.0.0"
}

variable "rcon_port" {
  type        = number
  description = "The host port number the internal port 25575 will map to"
  default     = 25575
}

variable "rcon_interface_bind" {
  type        = string
  description = "The network interface that port 25575 will bind to"
  default     = "0.0.0.0"
}

variable "server_type" {
  type        = string
  description = "The server type to use"
  validation {
    condition = contains(
      [
        "AIRPLANE",
        "BUKKIT",
        "CANYON",
        "CATSERVER",
        "CRUCIBLE",
        "FABRIC",
        "FORGE",
        "LIMBO",
        "MAGMA",
        "MOHIST",
        "PAPER",
        "PURPUR",
        "SPIGOT",
        "SPONGEVANILLA"
      ],
      var.server_type
    )
    error_message = "The provided server type was not valid."
  }
}

variable "message_of_the_day" {
  type        = string
  description = "Message that appears to the player before login in the server list"
}

variable "difficulty" {
  type        = string
  description = "The difficulty the server is set to"
  validation {
    condition = contains(
      [
        "peaceful",
        "easy",
        "normal",
        "hard"
      ],
      var.difficulty
    )
    error_message = "The provided value did not match a valid value."
  }
}

variable "player_whitelist" {
  type        = list(string)
  description = "The list of players tht are allowed to play on the server"
}

variable "admins" {
  type        = list(string)
  description = "The list of players that are server admins"
}

variable "max_player_count" {
  type        = number
  description = "The maximum amount of players allowed onto the server"
}

variable "max_world_size" {
  type        = number
  description = "Sets the maximum possible size in blocks, expressed as a radius, that the world border can obtain"
  default     = 29999984
}

variable "allow_nether" {
  type        = bool
  description = "Should players be allowed to access the nether?"
}

variable "announce_player_achievements" {
  type        = bool
  description = "Should achievements be announced to players?"
}

variable "force_gamemode" {
  type        = bool
  description = "Force players to join in the default game mode. False = Players will join in the game mode they left in, True = Players will always join in the default game mode."
}

variable "generate_structures" {
  type        = bool
  description = "Should structures (such as villages) be generated?"
}

variable "max_build_height" {
  type        = number
  description = "The maximum height in which building is allowed. Terrain may still naturally generate above a low height limit"
  default     = 256
}

variable "spawn_animals" {
  type        = bool
  description = "Should animals be able to spawn?"
}

variable "spawn_monsters" {
  type        = bool
  description = "Should monsters be able to spawn?"
}

variable "spawn_npcs" {
  type        = bool
  description = "Should NPCs be able to spawn?"
}

variable "view_distance" {
  type        = number
  description = "Sets the amount of world data the server sends the client, measured in chunks in each direction of the player (radius, not diameter). It determines the server-side viewing distance."
  default     = 10
}

variable "level_seed" {
  type        = string
  description = "Sets the servers seed"
}

variable "game_mode" {
  type        = string
  description = "Changes the game mode between survival, creative, adventure and spectator"
  validation {
    condition = contains(
      [
        "survival",
        "creative",
        "adventure",
        "spectator"
      ],
      var.game_mode
    )
    error_message = "The provided value did not match a valid value."
  }
}

variable "pvp" {
  type        = bool
  description = "By default, servers are created with player-vs-player (PVP) mode enabled. You can disable this with the PVP environment variable set to false"
  default     = false
}

variable "level_type" {
  type        = string
  description = "By default, a standard world is generated with hills, valleys, water, etc. A different level type can be configured by setting LEVEL_TYPE to an expected type"
  validation {
    condition = contains(
      [
        "default",
        "flat",
        "largebiomes",
        "amplified",
        "buffet",
        "biomesop",
        "biomesoplenty",
      ],
      var.level_type
    )
    error_message = "The provided value did not match a valid value."
  }
}

variable "minecraft_version" {
  type        = string
  description = "The version of minecraft to be run e.g. 1.16.5"
}

variable "java_version" {
  type        = string
  description = "The version of java to use in the container. As defined here https://github.com/itzg/docker-minecraft-server/blob/master/README.md#running-minecraft-server-on-different-java-version"
  default     = "latest"
}

variable "memory_limit" {
  type        = string
  description = "The amount of memory the containers JVM can access. Supported format/units as <size>[g|G|m|M|k|K]"
  default     = "1G"
}

variable "enable_rolling_logs" {
  type        = bool
  description = "By default the vanilla log file will grow without limit. The logger can be reconfigured to use a rolling log files. Set to false to disable rolling logs."
  default     = true
}

variable "enable_autopause" {
  type        = bool
  description = "Enabling auto pause will pause the JVM process 1 hour after the last client has disconnected."
}
