FROM ubuntu:latest
# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    curl \
    && curl -sL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm@latest -g \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
# Set the working directory
WORKDIR /app
# Copy package.json and package-lock.json
COPY package*.json ./
# Copy the rest of the application
COPY . .
#install dependencies
RUN npm install --legacy-peer-deps
# Expose port 3000
EXPOSE 3000
RUN npm i
# Command to start the application
CMD ["npm", "start"]
