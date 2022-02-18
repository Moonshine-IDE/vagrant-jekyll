#!/bin/bash

printf "\n\n\nUpdate project dependencies...\n"
cd /vagrant/jekyll-project
bundle install
bundle update

IS_SASS_USED=$1
if [ "$IS_SASS_USED" = true ] ; then
    printf "\n\n\nCompiling sass...\n"
    sass _sass/main.scss css/main.css
fi

printf "\n\n\nStarting server...\n"
bundle exec jekyll serve --host 0.0.0.0 --livereload --port 4000 --livereload-port 35729 --force_polling > /vagrant/jekyll_serve.log &!

sleep 20s
printf "\n\n\nStatic website generated and running at 127.0.0.1:4000 ...\n"
