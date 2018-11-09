repo=tekwrks
name=solid-server
version=1.0.0

.PHONY:build
build:
	docker image build \
		-t ${repo}/${name}:${version} .

.PHONY:interact
interact:
	docker container run \
		-it \
		--rm \
		--name ${repo}-${name}-dev \
		-t ${repo}/${name}:${version}

.PHONY:run
run:
	docker container run \
		-d \
		--rm \
		--name ${repo}-${name}-dev \
		-t ${repo}/${name}:${version}

.PHONY:kill
kill:
	docker rm $$( \
	docker kill $$( \
	docker ps -aq \
	--filter="name=${repo}-${name}-dev" ))
