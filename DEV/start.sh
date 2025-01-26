#!/bin/bash

# Vérifier si le répertoire de données est vide
if [ ! -d "/data" ] || [ -z "$(ls -A /data)" ]; then
    echo "Initialisation des données du serveur dans /data..."
    cp -R /home/minecraft/* /data
fi

# Générer le fichier server.properties à partir du template
echo "Génération du fichier server.properties..."
envsubst < /home/minecraft/server.properties.template > /data/server.properties

# Se déplacer dans le répertoire persistant
cd /data

# Lancer le serveur Minecraft
echo "Démarrage du serveur Minecraft..."
exec java -Xmx${MEMORY}M -Xms${MEMORY}M -jar server.jar nogui

