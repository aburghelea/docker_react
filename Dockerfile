FROM node:16-alpine as builderTMP
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
CMD ["npm", "run", "build"]

FROM nginx
EXPOSE 80
COPY --from=builderTMP /app/build /usr/share/nginx/html
