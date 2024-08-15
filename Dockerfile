# Use the official Node.js image as the base image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the React application
RUN npm run build

# Install a lightweight web server to serve the static files
RUN npm install -g serve

# Expose the port the app will run on
EXPOSE 3001

# Command to serve the build directory
CMD ["serve", "-s", "build", "-l", "3001"]
