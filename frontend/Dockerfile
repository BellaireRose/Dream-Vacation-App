# Use Node.js 18 LTS as base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Set the NODE_OPTIONS environment variable for legacy OpenSSL provider
ENV NODE_OPTIONS=--openssl-legacy-provider

# Expose the port the app runs on
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]
