    FROM node:16

    # Create app directory
    WORKDIR /app

    # Install app dependencies
    # A wildcard is used to ensure both package.json AND package-lock.json are copied
    # where available (npm@5+)
    COPY package*.json ./

    RUN npm install --legacy-peer-deps
    RUN npm install pm2 -g --legacy-peer-deps
    RUN npm install -g @nestjs/cli --legacy-peer-deps

    RUN chown -R node /app/node_modules

    # Bundle app source
    COPY . .
    RUN sh generate-prod-env.sh
    RUN nest build

    EXPOSE 4444
    CMD [ "pm2-runtime", "dist/apps/core/main.js" ]