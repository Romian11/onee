FROM ghcr.io/puppeteer/puppeteer:22.7.1

# Set environment variables
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome-stable

# Set the working directory
WORKDIR /usr/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Switch to root user to install dependencies
USER root

# Install dependencies
RUN npm ci --unsafe-perm

# Switch back to non-root user
USER pptruser

# Copy the rest of the application code
COPY . .

# Expose the port your app runs on
EXPOSE 3000

# Start the application
CMD ["node", "app.js"]
