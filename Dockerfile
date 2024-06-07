# Step 1: Build the Vue.js application
FROM node:18-alpine AS build

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install the application's dependencies
RUN npm install

# Copy all the application's source code into the working directory
COPY . .

# Build the application for production
RUN npm run build

# Step 2: Serve with Nginx
FROM nginx:alpine AS deploy

# Copy the build files from the first stage to the Nginx directory
COPY --from=build /app/dist /usr/share/nginx/html

# Expose the port on which Nginx will run
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
