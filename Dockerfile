FROM node

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json files from the backend folder
COPY backend/package*.json ./backend/

# Change the working directory to the backend folder
WORKDIR /app/backend

# Install backend dependencies
RUN npm install

# Copy the rest of the source code
COPY . .

# Add a start script to package.json
RUN echo '{"scripts": {"start": "node server.js"}}' > package.json

# Expose port (if necessary)
EXPOSE 3001

# Runtime command
CMD ["node", "server.js"]
