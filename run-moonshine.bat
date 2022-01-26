@echo off 

echo "Building and running your project please wait..."
vagrant ssh -c "cd /vagrant/jekyll-project/source && bundle install && sass _sass/main.scss css/main.css && bundle exec jekyll serve --host 0.0.0.0 --livereload --port 4000 --livereload-port 35729 --force_polling"
