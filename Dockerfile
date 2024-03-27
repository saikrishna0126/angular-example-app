# Use an appropriate Node.js base image
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json ./

# Copy the rest of the application to the container
COPY . .

RUN npm install
# Install Angular CLI globally
RUN npm install -g @angular/cli

# Install project dependencies
RUN npm install --legacy-peer-deps

# Build the Angular application
RUN npm run build

# Expose port 4200 (default port used by `ng serve`)
EXPOSE 4200

# Command to start the Angular development server
CMD ["ng", "serve"]
