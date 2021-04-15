
tag=tmp/test1

build:
	docker build -t $(tag) .


check-sees-gpus: build
	docker run -it $(tag) nvidia-smi

run-test1: build
	
	docker run -it $(tag)
run-test2: build
	docker run -all -it $(tag)