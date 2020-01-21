# Stage 1
FROM node:8.11.2-alpine as node

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN ng build mfe-poc

# Stage 2
FROM nginx:1.13.12-alpine

COPY --from=node /usr/src/app/dist/apps/mfe-poc /usr/share/nginx/html

COPY /nginx/nginx.conf /etc/nginx/conf.d/default.conf