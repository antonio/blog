require "middleman-smusher"

activate :automatic_image_sizes
activate :livereload

activate :blog do |blog|
  blog.sources = "articles/:year-:month-:day-:title.html"
  blog.default_extension = ".md"
end

page "/feed.xml", :layout => false

set :css_dir,    'stylesheets'
set :js_dir,     'javascripts'
set :images_dir, 'images'

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :smusher
end

activate :syntax

sprockets.append_path File.join(root, "bower_components")
