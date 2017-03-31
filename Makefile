VERSION := $(shell cat VERSION)

build:
	docker build -t guidof/onswebsite-search:$(VERSION) .

deploy: build
	docker push guidof/onswebsite-search:$(VERSION)
	docker tag  guidof/onswebsite-search:$(VERSION)  guidof/onswebsite-search:latest
	docker push guidof/onswebsite-search:latest

run: 
	docker run -p 9200:9200 -p 9300:9300  -e es.bootstrap.ignore_system_bootstrap_checks=true guidof/onswebsite-search:$(VERSION)
