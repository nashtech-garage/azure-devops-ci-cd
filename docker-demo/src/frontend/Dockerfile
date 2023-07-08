# Create image based on the official Node image from dockerhub
FROM node:lts-buster AS development
ENV DANGEROUSLY_DISABLE_HOST_CHECK=true
# Create app directory
WORKDIR /usr/src/app

# Copy dependency definitions
COPY package.json /usr/src/app
COPY package-lock.json /usr/src/app

# Install dependecies
#RUN npm set progress=false \
#    && npm config set depth 0 \
#    && npm i install
RUN npm ci

# Get all the code needed to run the app
COPY . /usr/src/app

# Expose the port the app runs in
EXPOSE 3000

# Serve the app
CMD ["npm", "start"]

#FROM development as dev-envs
#ENV DANGEROUSLY_DISABLE_HOST_CHECK=true
#
#RUN apt-get update
#RUN apt-get install -y --no-install-recommends git
#
#
#RUN useradd -s /bin/bash -m vscode
#RUN groupadd docker
#RUN usermod -aG docker vscode
#
#
## install Docker tools (cli, buildx, compose)
#COPY --from=gloursdocker/docker / /
#CMD [ "npm", "start" ]
