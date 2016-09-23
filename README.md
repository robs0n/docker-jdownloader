# docker-jdownloader

docker run -d --name=jdownloader --restart=unless-stopped -v /data/downloads:/opt/jdownloader/downloads -v /data/docker/jdownloader:/opt/jdownloader/cfg -e PUID=1000 -e PGID=1000 -e TZ="Europe/Berlin" jdownloader
