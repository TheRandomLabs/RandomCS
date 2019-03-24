FROM ubuntu:16.04
MAINTAINER TheRandomLabs (therandomlabsinc@gmail.com)

ENV USER csgo
ENV HOME /home/$USER
ENV SERVER $HOME/server

ENV METAMOD_SOURCE_LINK https://mms.alliedmods.net/mmsdrop/1.11/mmsource-1.11.0-git1125-linux.tar.gz
ENV SOURCEMOD_LINK https://sm.alliedmods.net/smdrop/1.10/sourcemod-1.10.0-git6390-linux.tar.gz

ENV WEB_API_KEY 0

ENV MAX_PLAYERS 15

ENV PASSWORD change_me
ENV RCON_PASSWORD change_me

ENV GSLT 0

ENV WORKSHOP_COLLECTION 1676153886
ENV WORKSHOP_START_MAP 610977040

RUN apt-get -y update && \
		apt-get -y --no-install-recommends install \
				lib32gcc1 curl net-tools lib32stdc++6 ca-certificates gdb && \
		apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
		useradd $USER && \
		mkdir $HOME && \
		chown $USER:$USER $HOME && \
		mkdir $SERVER

COPY cfg $SERVER/csgo/csgo/cfg
COPY csgo.sh $SERVER/csgo.sh
COPY update.sh $SERVER/update.sh
COPY update_csgo.txt $SERVER/update_csgo.txt
copy update_sourcemod.sh $SERVER/update_sourcemod.sh

RUN chown -R $USER:$USER $SERVER

USER $USER
RUN curl http://media.steampowered.com/client/steamcmd_linux.tar.gz | tar -C $SERVER -xvz

# /home/csgo/server/csgo
VOLUME $SERVER/csgo

EXPOSE 27015/tcp
EXPOSE 27015/udp
EXPOSE 27020/udp

WORKDIR $SERVER
ENTRYPOINT $SERVER/update.sh $METAMOD_SOURCE_LINK $SOURCEMOD_LINK && \
		$SERVER/csgo.sh -console -usercon -authkey $WEB_API_KEY -maxplayers_override $MAX_PLAYERS \
		-net_port_try 1 +game_type 0 +game_mode 1 +mapgroup mg_active +map de_dust2 \
		+sv_password $PASSWORD +rcon_password $RCON_PASSWORD +sv_setsteamaccount $GSLT \
		+host_workshop_collection $WORKSHOP_COLLECTION +workshop_start_map $WORKSHOP_START_MAP
