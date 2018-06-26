# use a node base image
# FROM node:7-onbuild
FROM joechiu/hellonode:latest

# set maintainer
LABEL maintainer "miiro@getintodevops.com"

RUN echo "Dockerfile: $(date)" >> /tmp/hello.txt
RUN sleep 10

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8001 || exit 1

# tell docker what port to expose
EXPOSE 8001
