###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# DatoCMS
activate :dato,
  token: '39a299371fd965b45275021398c1c9',
  base_url: 'https://www.mountadamschallenge.org/',
  live_reload: true

#

  require 'lib/helpers'
  helpers SiteHelpers

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Minify HTML
  activate :minify_html

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

  activate :directory_indexes
  page "*.pdf", :directory_index => false


# due to how middleman 4 collections work (http://bit.ly/2jHZTI9), 
# always use `dato` inside a `.tap` method block, like this:
dato.tap do |dato|

  # iterate over the "Blog post" records...
  dato.reports.each do |report|

    # ...and create a page for each report starting from a template!
    proxy "/reports/#{report.slug}/index.html", "/templates/report.html", locals: { report: report }

  end
end

# tell Middleman to ignore the template
ignore "/templates/*.html"
ignore "/results/index.html"
ignore "/route/index.html"

