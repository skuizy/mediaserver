#!/bin/sh

mv ./swag/config/nginx/proxy-confs/jackett.subdomain.conf.sample ./swag/config/nginx/proxy-confs/jackett.subdomain.conf
mv ./swag/config/nginx/proxy-confs/jellyfin.subdomain.conf.sample ./swag/config/nginx/proxy-confs/jellyfin.subdomain.conf
mv ./swag/config/nginx/proxy-confs/lidarr.subdomain.conf.sample ./swag/config/nginx/proxy-confs/lidarr.subdomain.conf
mv ./swag/config/nginx/proxy-confs/netdata.subdomain.conf.sample ./swag/config/nginx/proxy-confs/netdata.subdomain.conf
mv ./swag/config/nginx/proxy-confs/nextcloud.subdomain.conf.sample ./swag/config/nginx/proxy-confs/nextcloud.subdomain.conf
mv ./swag/config/nginx/proxy-confs/pihole.subdomain.conf.sample ./swag/config/nginx/proxy-confs/pihole.subdomain.conf
mv ./swag/config/nginx/proxy-confs/portainer.subdomain.conf.sample ./swag/config/nginx/proxy-confs/portainer.subdomain.conf
mv ./swag/config/nginx/proxy-confs/prowlarr.subdomain.conf.sample ./swag/config/nginx/proxy-confs/prowlarr.subdomain.conf
mv ./swag/config/nginx/proxy-confs/qbittorrent.subdomain.conf.sample ./swag/config/nginx/proxy-confs/qbittorrent.subdomain.conf
mv ./swag/config/nginx/proxy-confs/radarr.subdomain.conf.sample ./swag/config/nginx/proxy-confs/radarr.subdomain.conf
mv ./swag/config/nginx/proxy-confs/readarr.subdomain.conf.sample ./swag/config/nginx/proxy-confs/readarr.subdomain.conf
mv ./swag/config/nginx/proxy-confs/sonarr.subdomain.conf.sample ./swag/config/nginx/proxy-confs/sonarr.subdomain.conf

sed -i 's/upstream_proto https;/upstream_proto http;/g' swag/config/nginx/proxy-confs/nextcloud.subdomain.conf
sed -i 's/upstream_port 443;/upstream_port 80;/g' swag/config/nginx/proxy-confs/nextcloud.subdomain.conf

docker-compose restart swag
docker exec -u 33 -it nextcloud ./occ app:enable files_external
docker exec -u 33 -it nextcloud ./occ files_external:create -c datadir=\/data /media local null::null
