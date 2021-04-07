FROM node:14.16.0-buster-slim


ARG wiki_name=tiddlywiki
ARG wiki_port=8080
ARG wiki_username=admin
ARG wiki_password=admin
ARG gzip=no
ARG debug_level=none

#RUN apt-get update 

WORKDIR /app
COPY . /app
RUN npm install -g tiddlywiki
EXPOSE 8080
ENTRYPOINT ["/app/entrypoint.sh"]

