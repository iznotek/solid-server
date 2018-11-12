# dockerized Solid Server

[![Build Status](https://travis-ci.org/tekwrks/solid-server.svg?branch=master)](https://travis-ci.org/tekwrks/solid-server)

Dockerized [solid-server](https://solid.inrupt.com)

# Certificate

Solid server needs a ssl certificate to run.

You can use [let's encrypt](https://letsencrypt.org) to generate one, or run ```make generate-cert``` to generate one using openssl (this is for development only).

You can use a custom certificate by binding ```cert.pem``` and ```key.pem``` to ```/solid/key.pem``` and ```/solid/cert.pem``` respectively.

Make sure that docker can bind these files.

# Configuration

Default config is included in the image. (```config.json```)

You can use custom config by mounting it to ```/solid/config.json```.
