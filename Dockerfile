# Start from node image in LTS Version with alpine for small images
FROM node:lts-alpine

# Prepare npm environment
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin

# Install Chromium to use chrome headless for tests
RUN apk --update add --no-cache chromium
ENV CHROME_BIN /usr/bin/chromium-browser

# Prepare app directory with user rights
RUN mkdir -p /usr/src/app && chown -R node:node /usr/src/app
WORKDIR /usr/src/app

# Use node user
USER node

# Preinstall packages (with the same version as in the app) for faster CI/CD
# RUN npm install @angular/cli@11.2.5
# RUN npm install cypress@6.8.0
