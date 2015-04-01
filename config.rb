set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'festybox-intro/images'

set :bower_components, File.join(root, 'bower_components')

activate :directory_indexes

activate :meta_tags

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  # activate :asset_hash
end

after_configuration do
  sprockets.append_path bower_components
end
