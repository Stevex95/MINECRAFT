# Étape 1 : Base Java JRE
FROM eclipse-temurin:21-jre-jammy

# Variables d'environnement
ARG VERSION
ARG MEMORY
ARG EULA

# Crée un répertoire de travail
WORKDIR /home/minecraft

# Installer les dépendances nécessaires
RUN apt-get update && \
    apt-get install -yq vim curl gettext && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m minecraft && \
    mkdir -p /home/minecraft /data && \
    chown -R minecraft:minecraft /home/minecraft /data

# Copier le fichier server.properties.template et start.sh
COPY server.properties.template /home/minecraft/server.properties.template
COPY start.sh /home/minecraft/start.sh

# Télécharger le fichier server.jar de Minecraft
RUN curl -L "${VERSION}" -o /home/minecraft/server.jar

# Accepter le EULA en fonction de la variable d'environnement
RUN echo "eula=${EULA}" > /home/minecraft/eula.txt

# Donner les permissions d'exécution au script
RUN chmod +x /home/minecraft/start.sh

# Définir l'utilisateur pour exécuter le serveur
USER minecraft

# Commande par défaut
ENTRYPOINT ["/home/minecraft/start.sh"]

