# mediaserver


prérequis :
compte vpn wireguard (mullvad)
compte no-ip.com

configurer le swap

installation docker :
https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository

```
$ sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    pip
	
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

$ sudo add-apt-repository \
   "deb [arch=arm64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

$ sudo apt-get install docker-ce docker-ce-cli containerd.io

$ sudo groupadd docker

$ sudo usermod -aG docker $USER

$ sudo pip install docker-compose

$ exit
```

récupération projet docker-compose :
```
git clone https://github.com/skuizy/mediaserver.git

cd mediaserver
```

préparation de l'environement :
```
sudo useradd -M -b /home/$USER/mediaserver -s /sbin/nologin -u 1001 -G www-data sonarr
sudo useradd -M -b /home/$USER/mediaserver -s /sbin/nologin -u 1002 -G www-data radarr
sudo useradd -M -b /home/$USER/mediaserver -s /sbin/nologin -u 1003 -G www-data lidarr
sudo useradd -M -b /home/$USER/mediaserver -s /sbin/nologin -u 1004 -G www-data readarr
sudo useradd -M -b /home/$USER/mediaserver -s /sbin/nologin -u 1005 -G www-data prowlarr
sudo usermod -aG radarr,lidarr,readarr,prowlarr www-data
```

créer l'arborescence suivante dans /media :
```
/media
└── [drwxrwxr-x $USER   www-data]  DATA
    ├── [drwxrwxr-x $USER   www-data]  download
    └── [drwxrwxr-x $USER   www-data]  media
        ├── [drwxrwxr-x readarr  www-data]  book
        ├── [drwxrwxr-x radarr   www-data]  movie
        ├── [drwxrwxr-x lidarr   www-data]  music
        └── [drwxrwxr-x sonarr   www-data]  tv
```

mettre à jour les vairables `PIHOLE_WEBPASSWORD`, `DB_ROOT_PASSWORD`, `MY_DDNS_DOMAIN`, `NC_ADMIN_USER` et `NC_ADMIN_PASSWORD` dans le fichier `.env`

configurer la mise à jour dynamique du nom de domaine : `docker run -it --rm -v $(pwd)/noip:/usr/local/etc mqll/noip:2.1.9`
```
COMPOSE_HTTP_TIMEOUT=600 docker-compose up --build -d
```

configuration DNS local :
https://github.com/pi-hole/docker-pi-hole#installing-on-ubuntu
```
$ sudo sed -r -i.orig 's/#?DNSStubListener=yes/DNSStubListener=no/g' /etc/systemd/resolved.conf

$ sudo sh -c 'rm /etc/resolv.conf && ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf' 

$ sudo systemctl restart systemd-resolved
```

post installation :
ajout des applications News, Talk, External storage support, INotify file watcher dans nextcloud.
monter le répertoire /data en stockage externe dans nextcloud
ajouter les utilisateurs *arr à nextcloud pour créer des conversations dans Talk
configurer le baseurl des applications *arr
configurer le baseurl de jackett
configurer le baseurl de jellyfin ?
déposer scripts de notification dans *arr



configurer sslh sur hote en mode transparent
configurer authentification 2 facteurs Goole Authenticator
