# docker-jdownloader

docker run -d --name=jdownloader --restart=unless-stopped -v /data/downloads:/opt/jdownloader/downloads -v /data/docker/jdownloader:/opt/jdownloader/cfg -e PUID=<UID> -e PGID=<GID> -e TZ="Europe/Berlin" jdownloader
