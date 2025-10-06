# Use official Node.js LTS Alpine as base image
FROM node:20-alpine

# Create app directory
WORKDIR /usr/src/app

# Install dependencies first (for better caching)
COPY package.json package-lock.json* ./
RUN npm ci --only=production || npm install --only=production

# Copy app source
COPY . .

# Expose port 8080
EXPOSE 8080

# Start the server
CMD ["npm", "start"]