repo=tekwrks
name=solid-server
version=1.0.0

projectID=tekwrks

.PHONY:build
build:
	docker image build \
		-t ${repo}/${name}:${version} \
		.

.PHONY:generate-cert
generate-cert:
	openssl \
		req -x509 \
		-newkey rsa:4096 \
		-nodes \
		-subj '/CN=localhost' \
		-keyout key.pem -out cert.pem \
		-days 365

.PHONY:interact
interact:
	docker container run \
		-it \
		--rm \
		-p 8443:8443 \
		--mount type=bind,source=$$(pwd)/key.pem,target=/solid/key.pem,readonly \
		--mount type=bind,source=$$(pwd)/cert.pem,target=/solid/cert.pem,readonly \
		--name ${repo}-${name}-dev \
		-t ${repo}/${name}:${version}

.PHONY:run
run:
	docker container run \
		-d \
		-p 8443:8443 \
		--mount type=bind,source=$$(pwd)/key.pem,target=/solid/key.pem,readonly \
		--mount type=bind,source=$$(pwd)/cert.pem,target=/solid/cert.pem,readonly \
		--name ${repo}-${name}-dev \
		-t ${repo}/${name}:${version}

.PHONY:kill
kill:
	docker rm $$( \
	docker kill $$( \
	docker ps -aq \
	--filter="name=${repo}-${name}-dev" ))

.PHONY:push
push:
	docker tag \
		${repo}/${name}:${version} \
		gcr.io/${projectID}/${name}:${version}
	docker push \
		gcr.io/${projectID}/${name}:${version}

