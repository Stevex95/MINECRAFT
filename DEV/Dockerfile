FROM eclipse-temurin:21-jre-jammy
ARG VERSION
ARG MEMORY
ARG EULA
WORKDIR /home/minecraft
RUN apt-get update && \
    apt-get install -yq vim curl gettext && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m minecraft && \
    mkdir -p /home/minecraft /data && \
    chown -R minecraft:minecraft /home/minecraft /data
COPY server.properties.template /home/minecraft/server.properties.template
COPY start.sh /home/minecraft/start.sh
RUN curl -L "${VERSION}" -o /home/minecraft/server.jar
RUN echo "eula=${EULA}" > /home/minecraft/eula.txt
RUN chmod +x /home/minecraft/start.sh
USER minecraft
ENTRYPOINT ["/home/minecraft/start.sh"]

