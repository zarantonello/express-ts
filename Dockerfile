FROM node:14-alpine

LABEL author="tetchel@gmail.com"

ENV NODE_VERSION=16.13.0
RUN apt install -y curl
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version
RUN npm --version


WORKDIR /app
ENV NODE_ENV prod
ENV PORT 3000
EXPOSE 3000

COPY package*.json ./
RUN npm ci
COPY . ./
RUN npm run build
RUN npm prune --production



ENTRYPOINT [ "npm", "start" ]
