# Docker Solid Server
[![Build Status](https://travis-ci.org/tekwrks/solid-server.svg?branch=master)](https://travis-ci.org/tekwrks/solid-server)

Dockerized [solid-server](https://solid.inrupt.com)

## Certificate
Solid server needs a ssl certificate to run.

You can use [let's encrypt](https://letsencrypt.org), or run ```make generate-cert``` to generate one using openssl (this is for development only).

You can use a custom certificate by binding ```cert.pem``` and ```key.pem``` to ```/solid/key.pem``` and ```/solid/cert.pem``` respectively.

Make sure that docker can bind these files.

## Running it
This repo is linked with docker hub and automatically built, you can pull the image by running:
```bash
docker pull tekwrks/solid-server
```

After that you can run it using
```bash
docker container run \
  -d \
  -p 8443:8443 \
  --mount type=bind,source=$$(pwd)/key.pem,target=/solid/key.pem,readonly \
  --mount type=bind,source=$$(pwd)/cert.pem,target=/solid/cert.pem,readonly \
  -t tekwrks/solid-server:latest
```

Solid uses port 8443 by default. Access it at [https://localhost:8443](https://localhost:8443)

Make sure you have created the ssl certificate, since solid-server needs an https connection to work.

## Building it yourself
Clone this repo
```bash
git clone https://github.com/tekwrks/solid-server
```

Build the docker image and run it
```bash
make && make run
```
(inspect the makefile for exact commands used for building)

## Configuration
Default config is included in the image. ([```config.json```](https://github.com/tekwrks/solid-server/blob/master/config.json))

You can use custom config by mounting it to ```/solid/config.json```.

