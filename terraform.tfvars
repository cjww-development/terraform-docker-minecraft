docker_host                  = "unix:///var/run/docker.sock"
minecraft_volume_name        = "minecraft"
minecraft_network_name       = "minecraft-net"
minecraft_image_name         = "itzg/minecraft-server"
minecraft_container_name     = "minecraft"
server_port                  = 25565
server_interface_bind        = "0.0.0.0"
rcon_port                    = 25575
rcon_interface_bind          = "0.0.0.0"
server_type                  = "FORGE"
message_of_the_day           = "Welcome to the test forge server"
difficulty                   = "normal"
player_whitelist             = ["chrisofski"]
admins                       = ["chrisofski"]
max_player_count             = 5
max_world_size               = 29999984
allow_nether                 = true
announce_player_achievements = true
force_gamemode               = false
generate_structures          = true
max_build_height             = 256
spawn_animals                = true
spawn_monsters               = true
spawn_npcs                   = true
view_distance                = 10
level_seed                   = "-1"
game_mode                    = "creative"
pvp                          = true
level_type                   = "default"
minecraft_version            = "1.16.5"
java_version                 = "java11"
