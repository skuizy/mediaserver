#!/bin/sh

mv ./swag/config/nginx/proxy-confs/jackett.subdomain.conf.sample ./swag/config/nginx/proxy-confs/jackett.subdomain.conf
mv ./swag/config/nginx/proxy-confs/jellyfin.subdomain.conf.sample ./swag/config/nginx/proxy-confs/jellyfin.subdomain.conf
mv ./swag/config/nginx/proxy-confs/lidarr.subdomain.conf.sample ./swag/config/nginx/proxy-confs/lidarr.subdomain.conf
mv ./swag/config/nginx/proxy-confs/netdata.subdomain.conf.sample ./swag/config/nginx/proxy-confs/netdata.subdomain.conf
mv ./swag/config/nginx/proxy-confs/nextcloud.subdomain.conf.sample ./swag/config/nginx/proxy-confs/nextcloud.subdomain.conf
mv ./swag/config/nginx/proxy-confs/pihole.subdomain.conf.sample ./swag/config/nginx/proxy-confs/pihole.subdomain.conf
mv ./swag/config/nginx/proxy-confs/prowlarr.subdomain.conf.sample ./swag/config/nginx/proxy-confs/prowlarr.subdomain.conf
mv ./swag/config/nginx/proxy-confs/qbittorrent.subdomain.conf.sample ./swag/config/nginx/proxy-confs/qbittorrent.subdomain.conf
mv ./swag/config/nginx/proxy-confs/radarr.subdomain.conf.sample ./swag/config/nginx/proxy-confs/radarr.subdomain.conf
mv ./swag/config/nginx/proxy-confs/readarr.subdomain.conf.sample ./swag/config/nginx/proxy-confs/readarr.subdomain.conf
mv ./swag/config/nginx/proxy-confs/sonarr.subdomain.conf.sample ./swag/config/nginx/proxy-confs/sonarr.subdomain.conf

docker-compose restart swag
docker exec -u 33 -it nextcloud ./occ app:enable files_external
