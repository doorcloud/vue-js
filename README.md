# Launching a [Vue JS](https://vuejs.org/docs) (JavaScript) Application with Docker

This guide explains how to set up and launch a [Vue JS](https://vuejs.org/docs) (JavaScript) application using Docker.

## Prerequisites

Before starting, ensure you have the following tools installed on your machine:

- [Docker](https://www.docker.com/products/docker-desktop)

## Dockerfile Content

This repository contains a Docker setup for a Vue application.

```Dockerfile
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

```
## Steps to Launch the Application

1. Build the Docker Image

To build the Docker image, use the following command in the directory containing the Dockerfile:

```
docker build -t door-vue .
```

2. Run the Container

Once the image is built, run a container from this image:

```
docker run -p 8080:80 door-vue
```

3. Access the Application

Open your browser and go to the following URL to see your application running:

```
http://localhost:8080
```

4. Environment Variables

If you need to configure additional environment variables, modify the .env file that was copied into the container during the image build.

## Publishing the Image on Docker Hub

1. Log In to Docker Hub

Before publishing your image, log in to Docker Hub with your Docker account:

```
docker login
```

2. Tag the Image

Tag the image you built with your Docker Hub username and the image name:

```
docker tag door-vue your_dockerhub_username/door-vue:latest
```
Replace your_dockerhub_username with your Docker Hub username.

3. Push the Image to Docker Hub

Push the tagged image to Docker Hub:

```
docker push your_dockerhub_username/door-vue:latest
```
