# Use official Node.js image as the base image
FROM node:latest 

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to work directory
COPY package.json ./

# Install npm dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Build the Angular app
RUN npm run build

# Use NGINX web server to serve the Angular app
FROM nginx:alpine

# Copy the built Angular app from the build stage to NGINX web server directory
COPY --from=build /app/dist/angular-example-app /usr/share/nginx/html

# Expose port 80
EXPOSE 80
