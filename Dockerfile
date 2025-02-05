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

ARG VUE_APP_NAME="Cloudoor - Vue JS"

ENV VUE_APP_NAME=${VUE_APP_NAME}

# COPY .env.sample .env
# Build the application for production
RUN npm run build

# Step 2: Serve with Nginx
FROM nginx:alpine AS deploy

COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy the build files from the first stage to the Nginx directory
COPY --from=build /app/dist /usr/share/nginx/html

# Expose the port on which Nginx will run
EXPOSE 8080

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
