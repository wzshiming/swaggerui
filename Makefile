IMAGE := docker.io/swaggerapi/swagger-ui
PWD   := $(shell pwd)

.PHONY: swaggerui
swaggerui:
	rm -f ./swaggerui/*
	docker run --rm -v ${PWD}/swaggerui/:/swaggerui/ ${IMAGE} cp -r /usr/share/nginx/html/. /swaggerui
	rm -f ./swaggerui/*.{map,txt}
	cat ./swaggerui/swagger-initializer.js | sed 's#https://petstore.swagger.io/v2/swagger.json#./openapi.json#' > ./swaggerui/swagger-initializer.js.new && mv ./swaggerui/swagger-initializer.js.new ./swaggerui/swagger-initializer.js

