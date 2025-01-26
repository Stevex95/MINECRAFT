#!/bin/bash
# Vérifier si le répertoire de données est vide
if [ ! -d "/data" ] || [ -z "$(ls -A /data)" ]; then
    echo "Initialisation des données du serveur dans /data..."
    cp -R /home/minecraft/* /data
fi
# Se déplacer dans le répertoire persistant
cd /data
# Lancer le serveur Minecraft
exec java -Xmx${MEMORY}M -Xms${MEMORY}M -jar server.jar nogui
