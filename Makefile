
tag=tmp/test1

build:
	docker build -t $(tag) .

run-test: build
	docker run -it $(tag)