[![Apache-2.0 license](http://img.shields.io/badge/license-Apache-brightgreen.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)

terraform-docker-jenkins
========================

This repository deploys a Jenkins setup to docker

## Docs
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0.9 |
| <a name="requirement_docker"></a> [docker](#requirement\_docker) | 2.15.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_docker"></a> [docker](#provider\_docker) | 2.15.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [docker_container.minecraft](https://registry.terraform.io/providers/kreuzwerker/docker/2.15.0/docs/resources/container) | resource |
| [docker_image.minecraft_image](https://registry.terraform.io/providers/kreuzwerker/docker/2.15.0/docs/resources/image) | resource |
| [docker_network.minecraft_network](https://registry.terraform.io/providers/kreuzwerker/docker/2.15.0/docs/resources/network) | resource |
| [docker_volume.minecraft_volume](https://registry.terraform.io/providers/kreuzwerker/docker/2.15.0/docs/resources/volume) | resource |
| [docker_registry_image.minecraft](https://registry.terraform.io/providers/kreuzwerker/docker/2.15.0/docs/data-sources/registry_image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admins"></a> [admins](#input\_admins) | The list of players that are server admins | `list(string)` | n/a | yes |
| <a name="input_allow_nether"></a> [allow\_nether](#input\_allow\_nether) | Should players be allowed to access the nether? | `bool` | n/a | yes |
| <a name="input_announce_player_achievements"></a> [announce\_player\_achievements](#input\_announce\_player\_achievements) | Should achievements be announced to players? | `bool` | n/a | yes |
| <a name="input_difficulty"></a> [difficulty](#input\_difficulty) | The difficulty the server is set to | `string` | n/a | yes |
| <a name="input_docker_host"></a> [docker\_host](#input\_docker\_host) | The host where docker resides | `string` | n/a | yes |
| <a name="input_enable_rolling_logs"></a> [enable\_rolling\_logs](#input\_enable\_rolling\_logs) | By default the vanilla log file will grow without limit. The logger can be reconfigured to use a rolling log files. Set to false to disable rolling logs. | `bool` | `true` | no |
| <a name="input_force_gamemode"></a> [force\_gamemode](#input\_force\_gamemode) | Force players to join in the default game mode. False = Players will join in the game mode they left in, True = Players will always join in the default game mode. | `bool` | n/a | yes |
| <a name="input_game_mode"></a> [game\_mode](#input\_game\_mode) | Changes the game mode between survival, creative, adventure and spectator | `string` | n/a | yes |
| <a name="input_generate_structures"></a> [generate\_structures](#input\_generate\_structures) | Should structures (such as villages) be generated? | `bool` | n/a | yes |
| <a name="input_java_version"></a> [java\_version](#input\_java\_version) | The version of java to use in the container. As defined here https://github.com/itzg/docker-minecraft-server/blob/master/README.md#running-minecraft-server-on-different-java-version | `string` | `"latest"` | no |
| <a name="input_level_seed"></a> [level\_seed](#input\_level\_seed) | Sets the servers seed | `string` | n/a | yes |
| <a name="input_level_type"></a> [level\_type](#input\_level\_type) | By default, a standard world is generated with hills, valleys, water, etc. A different level type can be configured by setting LEVEL\_TYPE to an expected type | `string` | n/a | yes |
| <a name="input_max_build_height"></a> [max\_build\_height](#input\_max\_build\_height) | The maximum height in which building is allowed. Terrain may still naturally generate above a low height limit | `number` | `256` | no |
| <a name="input_max_player_count"></a> [max\_player\_count](#input\_max\_player\_count) | The maximum amount of players allowed onto the server | `number` | n/a | yes |
| <a name="input_max_world_size"></a> [max\_world\_size](#input\_max\_world\_size) | Sets the maximum possible size in blocks, expressed as a radius, that the world border can obtain | `number` | `29999984` | no |
| <a name="input_memory_limit"></a> [memory\_limit](#input\_memory\_limit) | The amount of memory the containers JVM can access. Supported format/units as <size>[g\|G\|m\|M\|k\|K] | `string` | `"1G"` | no |
| <a name="input_message_of_the_day"></a> [message\_of\_the\_day](#input\_message\_of\_the\_day) | Message that appears to the player before login in the server list | `string` | n/a | yes |
| <a name="input_minecraft_container_name"></a> [minecraft\_container\_name](#input\_minecraft\_container\_name) | The name of the Minecraft server container to be created | `string` | n/a | yes |
| <a name="input_minecraft_image_name"></a> [minecraft\_image\_name](#input\_minecraft\_image\_name) | The name of the Minecraft server docker image that should be pulled | `string` | n/a | yes |
| <a name="input_minecraft_network_name"></a> [minecraft\_network\_name](#input\_minecraft\_network\_name) | The name of the docker network that the Minecraft server container will be connected to | `string` | n/a | yes |
| <a name="input_minecraft_version"></a> [minecraft\_version](#input\_minecraft\_version) | The version of minecraft to be run e.g. 1.16.5 | `string` | n/a | yes |
| <a name="input_minecraft_volume_name"></a> [minecraft\_volume\_name](#input\_minecraft\_volume\_name) | The name of the docker volume to be used by the Minecraft server container | `string` | n/a | yes |
| <a name="input_player_whitelist"></a> [player\_whitelist](#input\_player\_whitelist) | The list of players tht are allowed to play on the server | `list(string)` | n/a | yes |
| <a name="input_pvp"></a> [pvp](#input\_pvp) | By default, servers are created with player-vs-player (PVP) mode enabled. You can disable this with the PVP environment variable set to false | `bool` | `false` | no |
| <a name="input_rcon_interface_bind"></a> [rcon\_interface\_bind](#input\_rcon\_interface\_bind) | The network interface that port 25575 will bind to | `string` | `"0.0.0.0"` | no |
| <a name="input_rcon_port"></a> [rcon\_port](#input\_rcon\_port) | The host port number the internal port 25575 will map to | `number` | `25575` | no |
| <a name="input_server_interface_bind"></a> [server\_interface\_bind](#input\_server\_interface\_bind) | The network interface that port 25565 will bind to | `string` | `"0.0.0.0"` | no |
| <a name="input_server_port"></a> [server\_port](#input\_server\_port) | The host port number the internal port 25565 will map to | `number` | `25565` | no |
| <a name="input_server_type"></a> [server\_type](#input\_server\_type) | The server type to use | `string` | n/a | yes |
| <a name="input_spawn_animals"></a> [spawn\_animals](#input\_spawn\_animals) | Should animals be able to spawn? | `bool` | n/a | yes |
| <a name="input_spawn_monsters"></a> [spawn\_monsters](#input\_spawn\_monsters) | Should monsters be able to spawn? | `bool` | n/a | yes |
| <a name="input_spawn_npcs"></a> [spawn\_npcs](#input\_spawn\_npcs) | Should NPCs be able to spawn? | `bool` | n/a | yes |
| <a name="input_view_distance"></a> [view\_distance](#input\_view\_distance) | Sets the amount of world data the server sends the client, measured in chunks in each direction of the player (radius, not diameter). It determines the server-side viewing distance. | `number` | `10` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_minecraft_container_entrypoint"></a> [minecraft\_container\_entrypoint](#output\_minecraft\_container\_entrypoint) | List of the entrypoints for the deployed container |
| <a name="output_minecraft_container_hostname"></a> [minecraft\_container\_hostname](#output\_minecraft\_container\_hostname) | The hostname assigned to the container after deploy |
| <a name="output_minecraft_container_id"></a> [minecraft\_container\_id](#output\_minecraft\_container\_id) | The id of the deployed container |
| <a name="output_minecraft_container_ip"></a> [minecraft\_container\_ip](#output\_minecraft\_container\_ip) | The ip address of the deployed container |
| <a name="output_minecraft_container_networks"></a> [minecraft\_container\_networks](#output\_minecraft\_container\_networks) | The networks associated with the deployed container |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

License
=======
This code is open sourced licensed under the Apache 2.0 License
