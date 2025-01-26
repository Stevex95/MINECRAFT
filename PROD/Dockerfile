FROM eclipse-temurin:21-jre-jammy
ARG VERSION="https://piston-data.mojang.com/v1/objects/4707d00eb834b446575d89a61a11b5d548d8c001/server.jar"
ARG MEMORY="8192"
VOLUME /data
WORKDIR /home/minecraft
RUN apt-get update && \
    apt-get install -yq vim curl && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m minecraft
RUN curl -fLo /home/minecraft/server.jar --retry 5 "$VERSION"
RUN java -Xmx${MEMORY}M -Xms${MEMORY}M -jar server.jar nogui || true
RUN echo "eula=true" > /home/minecraft/eula.txt
COPY start.sh /start.sh
RUN chmod +x /start.sh
RUN chown -R minecraft:minecraft /home/minecraft
USER minecraft
ENTRYPOINT ["/bin/bash", "/start.sh"]
