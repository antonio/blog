activate :automatic_image_sizes
activate :livereload

set :css_dir,    'assets/blog/'
set :js_dir,     'assets/blog/'
set :images_dir, 'assets/blog/'

configure :build do
  activate :minify_css
  activate :minify_javascript
end

sprockets.append_path File.join(root, "bower_components")
