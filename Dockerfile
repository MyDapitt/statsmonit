FROM ghcr.io/mydapitt/deb:jammy

RUN apt-get update && \
    apt-get install -y \
    curl \
    sudo \
    python3 \
    apt-get upgrade -y

RUN curl -fsSL https://deb.nodesource.com/setup_lts.x && \
    sudo -E bash && \
    apt-get install nodejs -y

RUN npm install && \
    npm run build

WORKDIR /home/container
COPY . /home/container
EXPOSE 8088 8081 443 8000 8080

CMD ["node", "index.js"]
