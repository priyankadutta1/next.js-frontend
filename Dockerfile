# Use Node.js LTS image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy dependency files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app source code
COPY . .

# Build the Next.js app
RUN npm run build

# Expose port 8080 (required by Cloud Run)
EXPOSE 8080
ENV PORT 8080

# Start Next.js app
CMD ["npm", "start"]
