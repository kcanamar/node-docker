# syntax=docker/dockerfile:1

# when we use the FROM command, we tell Docker to include in our image all the functionality from the node:18-alpine image
FROM node:18-alpine

# The NODE_ENV environment variable specifies the environment in which an application is running (usually, development or production)
ENV NODE_ENV=production

# This instructs Docker to use this path as the default location for all subsequent commands. 
# This way we do not have to type out full file paths but can use relative paths based on the working directory
WORKDIR /app

# The COPY command takes two parameters: src and dest. 
# The first parameter src tells Docker what file(s) you would like to copy into the image. 
# The second parameter dest tells Docker where you want that file(s) to be copied to
# You can specify multiple src resources seperated by a comma
COPY ["package.json", "package-lock.json*", "./"]

# use the RUN command to execute the command npm install. 
# This works exactly the same as if we were running npm install locally on our machine.
# But this time these Node modules will be installed into the node_modules directory inside our image
RUN npm install --production

# Copy in the source code into the image
COPY . .

# tell Docker what command we want to run when our image is run inside of a container with the CMD command
CMD ["node", "server.js"]

