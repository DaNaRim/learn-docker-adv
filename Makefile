include config/.env

ABS_PATH := $(shell cygpath -w $(shell pwd))

build:
	docker build -t danarim/logsapp .
run:
	docker run -d -p 3000:${PORT} -v logs:/app/data --rm --name logsapp danarim/logsapp
run-with-config:
	docker run -d -p 3000:${PORT} --env-file ./config/.env --rm --name logsapp danarim/logsapp
run-dev:
	docker run -d -p 3000:${PORT} -v "$(ABS_PATH):/app" -v /app/node_modules -v logs:/app/data --rm --name logsapp danarim/logsapp
stop:
	docker stop logsapp