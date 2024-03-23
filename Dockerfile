# Use an appropriate Node.js base image with Angular CLI pre-installed
FROM node:14

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Copy the rest of the application

# Install dependencies including Angular CLI
RUN npm install -g @angular/cli 

# Copy the rest of the application
COPY . .

RUN  npm install –legacy-peer -deps 

RUN ng build


# Expose port 4200 (default port used by `ng serve`)
EXPOSE 4200

# Command to start the Angular development server
CMD ["ng", "serve", "--host", "0.0.0.0"]
