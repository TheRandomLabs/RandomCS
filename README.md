# RandomCS

![Counter-Strike: Global Offensive](
https://upload.wikimedia.org/wikipedia/en/thumb/1/1b/CS-GO_Logo.svg/1920px-CS-GO_Logo.svg.png)

128-tick dedicated CS:GO server in Docker with SourceMod and workshop maps.

By default, the server is configured to run the custom Quickplay gamemode, which is designed
for messing around on relatively small maps.

The CS:GO server is downloaded/updated when the container starts, and default configs are supplied.
Additionally, `mapchooser`, `nominations` and `rockthevote` are enabled by default.

## Environment variables

`METAMOD_SOURCE_LINK https://mms.alliedmods.net/mmsdrop/1.11/mmsource-1.11.0-git1127-linux.tar.gz`

The link to Metamod:Source.

`SOURCEMOD_LINK https://sm.alliedmods.net/smdrop/1.10/sourcemod-1.10.0-git6392-linux.tar.gz`

The link to SourceMod.

`PORT 27015`

The main port. This should be exposed over TCP and UDP.

`TV_PORT 27020`

The GOTV port. This should be exposed over UDP.

`WEB_API_KEY 0`

The [Steam web API key](https://steamcommunity.com/dev/apikey),
required for downloading workshop maps.

`MAX_PLAYERS 15`

The maximum number of players on the server.

`PASSWORD change_me`

The password to connect to the server.

`RCON_PASSWORD change_me`

The password to connect via RCON to the server.

`GSLT 0`

The [gameserver login token](https://steamcommunity.com/dev/managegameservers).

`WORKSHOP_COLLECTION 1676153886`

The ID of the workshop collection.

`WORKSHOP_START_MAP 610977040`

The ID of the workshop map that the server starts on.

## Volumes

`/home/csgo/server/csgo`

The CS:GO server files.

## Basic run command

`docker run -d -p 27015:27015 -p 27015:27015/udp -p 27020:27020/udp --restart always
--name RandomCS -e WEB_API_KEY={KEY} -e GSLT={TOKEN} -e PASSWORD={PASSWORD}
-e RCON_PASSWORD={RCON_PASSWORD} therandomlabs/randomcs`

To use different ports:

`docker run -d -p 27016:27016 -p 27016:27016/udp -p 27021:27021/udp --restart always
--name RandomCS -e PORT 27016 -e TV_PORT 27021 -e WEB_API_KEY={KEY} -e GSLT={TOKEN}
-e PASSWORD={PASSWORD} -e RCON_PASSWORD={RCON_PASSWORD} therandomlabs/randomcs`
