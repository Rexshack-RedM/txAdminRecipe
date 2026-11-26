# RSG RedM Framework txAdminRecipe

**Description:** RedM RSG Server Build

A [txAdmin](https://github.com/tabarra/txAdmin) recipe that builds a complete RedM roleplay server on the **RSG Framework**. It downloads the resources, creates the database tables and installs a ready-made `server.cfg`.

- Website: https://www.rsgcore.com
- Documentation: https://www.rsgcore.com/docs/
- Discord: https://discord.gg/FvQcbJGdbp
- GitHub: https://github.com/Rexshack-RedM

## Contents

- [What you get](#what-you-get)
- [Requirements](#requirements)
- [Installation](#installation)
- [After installation](#after-installation)
- [Staff permissions](#staff-permissions)
- [Server layout and start order](#server-layout-and-start-order)
- [Included resources](#included-resources)
- [Updating](#updating)
- [Troubleshooting](#troubleshooting)
- [Recipe files](#recipe-files)

## What you get

- The RSG Framework: `rsg-core` (with multi-job built in) and a large set of RSG resources for jobs, economy, activities and roleplay
- A prepared database (`rsgcore.sql`)
- A configured `server.cfg` with OneSync, native voice settings, resource start order and a staff permission hierarchy
- Standalone libraries, community card games and map resources

## Requirements

| Requirement | Notes |
|---|---|
| FXServer with txAdmin | Use a current recommended artifact for [Windows](https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/) or [Linux](https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/) |
| MariaDB (recommended) or MySQL | Must be installed and running before you deploy |
| Cfx.re license key | Create one at https://portal.cfx.re/ |
| Game build `1491` | Already enforced in `server.cfg` |
| OneSync | Already enabled in `server.cfg` |
| Open port | `30120` TCP and UDP by default |
| Internet access to GitHub | The recipe downloads the resources during deployment |

## Installation

1. Install and start your database server.
2. Download and extract the FXServer artifact, then start it (`FXServer.exe` on Windows, `run.sh` on Linux).
3. Open txAdmin (by default `http://localhost:40120`), enter the PIN from the console and link your Cfx.re account.
4. In the setup wizard, name your server and choose **Remote URL Template**.
5. Paste this URL:

   ```
   https://raw.githubusercontent.com/Rexshack-RedM/txAdminRecipe/main/rsgcore.yaml
   ```

6. Choose an empty folder for the server data.
7. Enter your license key and database details, then run the recipe.
8. Wait for every task to finish. The recipe pauses now and then to avoid GitHub rate limits.
9. Check `server.cfg`, then save it and start the server.

For more on how recipes work, see the [txAdmin Recipe Documentation](https://github.com/tabarra/txAdmin/blob/master/docs/recipe.md).

## After installation

Review these settings in `server.cfg`:

| Setting | Purpose |
|---|---|
| `sv_maxclients` | Player slots (set from your txAdmin answer) |
| `setr rsg:locale "en"` | Language for RSG resources |
| `set mysql_connection_string` | Database connection (filled in by txAdmin) |
| `set mysql_slow_query_warning 300` | Logs database queries slower than 300 ms |
| `setr voice_useNativeAudio` and related lines | Voice settings used with `rsg-voice` |
| `sv_licenseKey` | Your license key. Keep it private |

- Set your server name, description, tags and banners at https://portal.cfx.re/
- Never share or commit a deployed `server.cfg`: it holds your license key and database password.
- Each resource has its own configuration, usually in `config.lua` or a `shared` folder. Read the resource's `README.md` and `DOCS.md` where provided.

## Staff permissions

`server.cfg` sets up these groups. Each group inherits the one below it.

`rsgcore.god` > `rsgcore.headadmin` > `rsgcore.developer` > `rsgcore.admin` > `rsgcore.mod` > `rsgcore.helper`

txAdmin fills in the master account's principals when it deploys. To give a player a staff rank, add their license identifier under the matching section of `server.cfg`, remove the leading `#`, and restart the server:

```cfg
add_principal identifier.license:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx rsgcore.god
```

- `rsgcore.god` also receives all `group.admin` commands.
- `rsg-core` gives each lower group access only to the commands registered for it.
- `rsgcore.mod` and above can join while the server is closed (`RSGConfig.Server.Closed = true`).

## Server layout and start order

| Folder in `resources` | Contents |
|---|---|
| `[cfx-default]` | Default Cfx.re resources (the old default chat is removed) |
| `[standalone]` | Libraries and standalone resources |
| `[framework]` | RSG resources |
| `[community]` | Community-made resources |
| `[mapmods]` | Mapping resources |

Resources start in tiers, so each one starts after the resources it needs:

1. Cfx defaults
2. Database and libraries
3. Core framework (`rsg-core` first)
4. The rest of `[framework]`
5. `[mapmods]` and `[community]`

When you add a resource that others depend on, `ensure` it before them. Do not install `rsg-multijob`, `weathersync`, `rsg-bossmenu` or `rsg-gangmenu`: `rsg-core`, `rsg-weather` and `rsg-society` replace them.

## Included resources

### Core and player systems

| Resource | What it does |
|---|---|
| rsg-core | Players, characters, money, jobs with multi-job, gangs, permissions, callbacks and notifications |
| rsg-inventory | Slot and weight inventory, hotbar, stashes, ground drops and shops |
| rsg-character | Character selection and creation, clothing stores and spawn selection |
| rsg-wardrobe | Clothing items, saved outfits and clothing care |
| rsg-barbers | Hair, beard and makeup with live preview |
| rsg-hud | Player and horse HUD |
| rsg-playerinfo | `/info` character dashboard |
| rsg-loading | Loading screen |
| rsg-queue | Connection queue with VIP priority, reserved slots and crash grace |
| rsg-chat | Chat channels managed in game |
| rsg-voice | Proximity voice |
| rsg-radio | Field radio with frequencies and job channels |
| rsg-target | Targeting system for peds, objects and zones |
| rsg-gizmo | Standard prop placement tool |
| rsg-radialmenu | Radial interaction menu |
| rsg-animations | Emote and animation menu |
| rsg-essentials | AFK kick, hands up, pointing, river wash and other utilities |
| rsg-adminmenu | Staff panel with roles, reports, logs and world tools |

### World and environment

| Resource | What it does |
|---|---|
| rsg-weather | Time, weather and wind sync |
| rsg-zonenotify | Location banner for states, districts and towns |
| rsg-npcs | Ambient NPCs with blips, scenarios and audio |
| rsg-npcdialog | NPC conversations and quests with an in-game editor |
| rsg-doorlock | Database door locks with an in-game editor |
| rsg-trapdoors | Animated trapdoors with optional passcodes |

### Economy, progression and organisations

| Resource | What it does |
|---|---|
| rsg-banking | Separate town bank branches |
| rsg-economy | Town treasuries, taxes, market prices and town projects |
| rsg-skills | Shared XP, levels, perks and leaderboards |
| rsg-reputation | Honor and regional standing |
| rsg-society | Job and gang members, ranks, finances, payroll and storage |
| rsg-gangs | Player-run gangs with camps and a shared bank |
| rsg-townhall | Job vacancies, applications and approvals |
| rsg-loyalty | Playtime points, tiers and rewards |
| rsg-stores | NPC and player-owned stores |
| rsg-trader | NPC traders with prices that follow stock |
| rsg-auction | Town auction houses |
| rsg-playertrade | Secure two-way trading of items and cash between players |
| rsg-contracts | Written contracts between players with held payment |
| rsg-factory | Admin-built factories and production lines |

### Law, medical and crime

| Resource | What it does |
|---|---|
| rsg-lawman | Law enforcement and sheriff management |
| rsg-mdt | Criminal records terminal |
| rsg-prison | Prison system |
| rsg-medic | Death system and doctor job |
| rsg-bountyhunter | Wanted posters and outlaw hunting |
| rsg-robbery | Player-to-player robbery |
| rsg-looting | NPC looting and player robbery |
| rsg-lockpick | Lockpicking minigame |
| rsg-drugs | Cannabis production, corner selling and addiction |
| rsg-moonshine | Placeable moonshine stills |
| rsg-ambush | Random gang ambushes on the trail |

### Jobs, gathering and production

| Resource | What it does |
|---|---|
| rsg-hunting | Hunting, trapper, butcher and hunting XP |
| rsg-legendary | Legendary animal hunts |
| rsg-samples | Animal sample collecting |
| rsg-fishing | Fishing with bait and catches |
| rsg-fishmonger | Sell and fillet fish |
| rsg-herbalist | Herb gathering and tonic crafting |
| rsg-farming | Plant, water and harvest crops |
| rsg-ranch | Ranches and livestock |
| rsg-beekeeper | Beehives, honey and beeswax |
| rsg-lumberjack | Grow, chop and sell timber |
| rsg-mining | Mine leases and NPC workers |
| rsg-rocks | Rock and salt mining, drilling and ore smelting |
| rsg-smelting | Turn ores into metal bars |
| rsg-goldpanning | River gold panning |
| rsg-goldclaim | Gold claims and rockers |
| rsg-crafting | XP-based crafting book |
| rsg-cooking | Cooking stations |
| rsg-wellpump | Placeable well pumps and water buckets |
| rsg-deliveries | Wagon delivery contracts |

### Food, items and survival

| Resource | What it does |
|---|---|
| rsg-consume | Eating and drinking |
| rsg-canteen | Fill and drink from a canteen |
| rsg-bathing | Bathhouses |
| rsg-smoking | Cigarettes, cigars, pipes and chewing tobacco |
| rsg-poison | Poison and antidotes |
| rsg-backpacks | Wearable backpacks with storage |
| rsg-bandana | Raise and lower a bandana |

### Weapons

| Resource | What it does |
|---|---|
| rsg-weapons | Weapon equipping, wear, repairs and loadouts |
| rsg-ammo | Ammunition saved per character |
| rsg-weaponcomp | Weapon customisation at a portable workbench |

### Horses, pets and transport

| Resource | What it does |
|---|---|
| rsg-stables | Buy, care for, customise and breed horses |
| rsg-huntingpets | Hunting dogs and birds |
| rsg-wagons | Wagon yards and wagon ownership |
| rsg-boats | Boat yards and boat storage |
| rsg-railroad | Trains and railroad companies |
| rsg-trams | Saint Denis trolleys |
| rsg-guarma | Boat travel to Guarma |
| rsg-hotair | Hot air balloon hire |

### Communication and housing

| Resource | What it does |
|---|---|
| rsg-telegram | Telegrams and address book |
| rsg-telephone | Placeable telephones with private calls |
| rsg-noticeboard | Player notice boards |
| rsg-housing | Monthly house rentals |

### Leisure and collectables

| Resource | What it does |
|---|---|
| rsg-theatre | Saint Denis stage shows |
| rsg-cinema | Moving picture shows |
| rsg-lottery | Daily lottery |
| rsg-roulette | Multiplayer roulette |
| rsg-fortuneteller | Fortune teller machines |
| rsg-cards | Collectable cigarette cards |
| rsg-treasure | Treasure maps and metal detecting |
| rsg-targetpractise | Archery and throwing knife targets |
| rsg-fireworks | Fireworks and displays |

### Standalone, community and maps

| Resource | Source |
|---|---|
| Cfx default resources | https://github.com/citizenfx/cfx-server-data |
| oxmysql | https://github.com/CommunityOx/oxmysql |
| xsound | https://github.com/Xogy/xsound |
| interact-sound | https://github.com/Rexshack-RedM/interact-sound |
| redm-female-fix | https://github.com/Popisek/redm-female-fix |
| Nt_Blackjack | https://github.com/Nubetastic/Nt_Blackjack |
| Nt_Holdem | https://github.com/Nubetastic/Nt_Holdem |
| rsg-mapping | https://github.com/Rexshack-RedM/rsg-mapping |
| redm-ymaps | https://github.com/Rexshack-RedM/redm-ymaps |

## Updating

The recipe is for **first-time deployment**. It does not update a running server.

1. Stop the server.
2. Back up your database and server data folder.
3. Download the new version of each resource you want to update from its repository.
4. Read its `README.md` and `DOCS.md` for database or configuration changes.
5. Move your own settings into the new configuration files, then start the server and check the console.

Do not run `rsgcore.sql` against a live database as an update method.

## Troubleshooting

| Problem | What to check |
|---|---|
| A download task fails | GitHub may be rate limiting or unavailable. Wait, then deploy again into an empty folder |
| Database connection or import fails | The database server is running, and the user, password and permissions are correct |
| Server does not start | Your license key is valid and port `30120` is not already in use |
| A resource does not start | Read the first error in the server console, then check its dependencies and start order |
| Staff commands do not work | The identifier is correct, the line has no leading `#`, and the server has been restarted |

Still stuck? Ask in [Discord](https://discord.gg/FvQcbJGdbp) and include the first console error. Remove your license key and database password before sharing anything.

## Recipe files

| File | Purpose |
|---|---|
| `rsgcore.yaml` | The deployment tasks txAdmin runs |
| `rsgcore.sql` | Database tables and data |
| `server.cfg` | Server configuration template |
