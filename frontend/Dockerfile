FROM node:16.3.0-alpine

# Create app directory
RUN mkdir -p /app
WORKDIR /app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./


# If you are building your code for production
RUN npm ci 
RUN npm install react-scripts@3.4.1 -g --silent


# Bundle app source
COPY . .


EXPOSE 3000

CMD ["npm", "start"]

