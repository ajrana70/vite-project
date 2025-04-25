# Stage 1: Build the React app
FROM node:18 AS builder

# Set working directory
WORKDIR /app

# Copy dependencies and install
COPY package*.json ./
RUN npm install

# Copy rest of the project and build
COPY . .
RUN npm run build


# Expose port
EXPOSE 80

# Start Nginx server
CMD ["npm", "run", "dev"]
