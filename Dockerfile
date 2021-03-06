FROM mhart/alpine-node:8

# Install solid-server globally
RUN npm update && npm install -g solid-server

# Create directory structure
WORKDIR /solid
RUN \
  mkdir data && \
  mkdir .db

# Copy default config
COPY ./config.json .

VOLUME /solid/data
EXPOSE 8443
ENTRYPOINT ["/usr/bin/solid", "start", "--multiuser"]
