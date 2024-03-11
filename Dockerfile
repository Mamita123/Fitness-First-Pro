FROM node

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install backend dependencies
RUN npm install

# Copy the rest of the source code
COPY . .

# Add a start script to a separate package.json
RUN echo '{"scripts": {"start": "node server.js"}}' > start-package.json

# Install dependencies for the start script
RUN npm install

# Rename start-package.json to package.json
RUN mv start-package.json package.json

# Expose port (if necessary)
EXPOSE 3001

# Runtime command
CMD ["node", "server.js"]
