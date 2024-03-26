# Use an appropriate Node.js base image
FROM node:16-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json ./

# Install Angular CLI globally
RUN npm install -g @angular/cli
RUN npm cache clean -f

# Install project dependencies
RUN npm install --legacy-peer-deps

# Copy the rest of the application
COPY . .

# Build the Angular application
RUN ng build

# Expose port 4200 (default port used by `ng serve`)
EXPOSE 4200

# Command to start the Angular development server
CMD ["ng", "serve", "--host", "0.0.0.0", "--port", "4200"]
