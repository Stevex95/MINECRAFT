#!/bin/bash
if [ ! -d "/data" ] || [ -z "$(ls -A /data)" ]; then
    echo "Initialisation des données du serveur dans /data..."
    cp -R /home/minecraft/* /data
fi
echo "Génération du fichier server.properties..."
envsubst < /home/minecraft/server.properties.template > /data/server.properties
cd /data
echo "Démarrage du serveur Minecraft..."
exec java -Xmx${MEMORY}M -Xms${MEMORY}M -jar server.jar nogui
