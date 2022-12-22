FROM node:latest as build
WORKDIR /app
## Copyin the current directory into Working Directory
COPY . .
RUN npm install
RUN npm run build 

## Copy the build to Nginx server
FROM nginx:latest
WORKDIR /mydir
COPY --from=build /app/dist/my-angular-app .
EXPOSE 80