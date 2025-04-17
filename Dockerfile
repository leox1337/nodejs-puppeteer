FROM ghcr.io/parkervcp/yolks:nodejs_20

USER root

# Instalar dependências para o Puppeteer/Chromium
RUN apt-get update && apt-get install -y \
    libasound2 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdbus-1-3 \
    libgdk-pixbuf2.0-0 \
    libnspr4 \
    libnss3 \
    libxss1 \
    libxtst6 \
    fonts-liberation \
    libappindicator1 \
    xdg-utils \
    --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Definir variável de ambiente para o Puppeteer
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Voltar para o usuário container
USER container

WORKDIR /home/container

CMD ["/bin/bash", "entrypoint.sh"]
