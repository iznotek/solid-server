FROM mhart/alpine-node:8

RUN npm update && npm install -g solid-server

WORKDIR /solid

CMD ["/usr/bin/solid", "start"]
