#!/bin/sh
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
heroku plugins:install heroku-container-registry
docker login --username=_ --password=$(heroku auth:token) registry.heroku.com
heroku container:push web --app $HEROKU_APP_NAME
