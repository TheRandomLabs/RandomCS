# RandomCS

128-tick dedicated CS:GO server in Docker with SourceMod and workshop maps.

By default, the server is configured to run the custom Quickplay gamemode, which is designed
for messing around on relatively small maps.

The CS:GO server is downloaded/updated when the container starts, and default configs are supplied.
Additionally, `mapchooser`, `nominations` and `rockthevote` are enabled by default.

## Environment variables

`METAMOD_SOURCE_LINK https://mms.alliedmods.net/mmsdrop/1.11/mmsource-1.11.0-git1125-linux.tar.gz`

The link to Metamod:Source.

`SOURCEMOD_LINK https://sm.alliedmods.net/smdrop/1.10/sourcemod-1.10.0-git6390-linux.tar.gz`

The link to SourceMod.

`WEB_API_KEY 0`

The Steam web API key, required for downloading workshop maps.

`MAX_PLAYERS 15`

The maximum number of players on the server.

`PASSWORD change_me`

The password to connect to the server.

`RCON_PASSWORD change_me`

The password to connect via RCON to the server.

`GSLT 0`

The gameserver login token.

`WORKSHOP_COLLECTION 1676153886`

The ID of the workshop collection.

`WORKSHOP_START_MAP 610977040`

The ID of the workshop map that the server starts on.
