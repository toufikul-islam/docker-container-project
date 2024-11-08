# # Use an LTS version of Node.js as the base image
# FROM node:18 AS build

# # Set the working directory inside the container
# WORKDIR /app

# # Set NODE_OPTIONS to suppress experimental warnings
# ENV NODE_OPTIONS=--no-warnings

# # Install Angular CLI globally
# RUN npm install -g @angular/cli

# # Install project dependencies
# COPY package*.json ./
# RUN npm install

# # Copy project files into the container
# COPY . .

# # Build the Angular app in production mode
# RUN npm run build --configuration=production

# # Use Nginx to serve the app
# FROM nginx:latest

# # Copy the custom Nginx configuration file
# COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# # Copy the build artifacts from the build stage to the Nginx container
# COPY --from=build /app/dist/docker-project /usr/share/nginx/html

# # Expose port 80 (Nginx default)
# EXPOSE 4200

# # Start Nginx in the foreground
# CMD ["nginx", "-g", "daemon off;"]

# Step 1: Use a Node.js base image to build and serve the app
FROM node:18 AS build

# Set the working directory inside the container
WORKDIR /app

# Set NODE_OPTIONS to suppress warnings (optional)
ENV NODE_OPTIONS=--no-warnings

# Install Angular CLI globally
RUN npm install -g @angular/cli

# Install project dependencies
COPY package*.json ./
RUN npm install

# Copy the project files into the container
COPY . .

# Build the Angular app in production mode
RUN npm run build --configuration=production

# Step 2: Expose port 4200 for the Angular development server
EXPOSE 4200

# Step 3: Run `ng serve` to start the Angular development server
CMD ["ng", "serve", "--host", "0.0.0.0", "--disable-host-check"]

