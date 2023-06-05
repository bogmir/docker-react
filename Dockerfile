FROM node:16-alpine
WORKDIR '/usr/app'
COPY package*.json ./
RUN npm install
RUN chown -R node.node /usr/app/node_modules
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /usr/app/build /usr/share/nginx/html