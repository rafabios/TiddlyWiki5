#!/bin/bash


# check variables

if [ -z "$wiki_port" ]; then export wiki_port=8080; else echo "ok"; fi
if [ -z "$wiki_name" ]; then export wiki_name=tiddlywiki; else echo "ok"; fi
if [ -z "$wiki_username" ]; then export wiki_username=admin; else echo "ok"; fi
if [ -z "$wiki_password" ]; then export wiki_password=admin; else echo "ok"; fi
if [ -z "$gzip" ]; then export gzip=no; else echo "ok"; fi
if [ -z "$debug-level" ]; then export debug-level=none; else echo "ok"; fi




# Init server
tiddlywiki $wiki_name --init server


# Check for plugins
if [ -z "$wiki_plugins" ]
then
      echo "\$wiki_plugins is empty"
else
      echo "\$wiki_plugins is set"
      sed  -i "s|/tiddlyweb\",|/tiddlyweb\",$wiki_plugins|g" $wiki_name/tiddlywiki.info || true
fi

# Build index
tiddlywiki $wiki_name --build index

# Start server
tiddlywiki $wiki_name --listen host=0.0.0.0 \
port=$wiki_port \
username=$wiki_username \
password=$wiki_password \
gzip=$wiki_gzip \
debug-level=$debug_level
