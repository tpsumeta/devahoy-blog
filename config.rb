###
# Blog settings
###

# Time.zone = "UTC"

# Enable Localization (i18n)
# activate :i18n

# Enable Syntax Highlighter
activate :syntax

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"

  blog.permalink = "{year}/{month}/{title}"
  # blog.permalink = "{title}.html"
  # Matcher for blog source files
  blog.sources = "posts/{year}-{month}-{day}-{title}"
  blog.taglink = "tags/{tag}/"
  # blog.layout = "layouts"
  # blog.summary_separator = /(READMORE)/
  blog.summary_length = 200
  blog.year_link = "{year}.html"
  blog.month_link = "{year}/{month}.html"
  blog.day_link = "{year}/{month}/{day}.html"
  blog.default_extension = ".md"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/{num}"
end
activate :directory_indexes

page "/feed.xml", layout: false

## Default Global Variable

set :blog_url, 'http://devahoy.com'
set :blog_name, 'Dev::Ahoy'
set :blog_description, 'Blog เกี่ยวกับการเขียนโปรแกรม Android, การทำแอพ Android, ทำ Games, Android Games และ Web Development'
set :copyright, 'DevAhoy.com'
set :cover_image, '/images/cover/bg.svg'
set :author_name, 'Chai Phonbopit'

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
# page "/page/*", layout: :test

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes



# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end


set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

activate :s3_sync do |s3_sync|
  s3_sync.bucket                     = 'devahoy.com' 
  s3_sync.region                     = 'us-east-1'    
  s3_sync.aws_access_key_id          = ENV['AWS_ACCESS_KEY_ID']
  s3_sync.aws_secret_access_key      = ENV['AWS_SECRET_ACCESS_KEY']
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  activate :gzip

  # Optimze Images
  activate :imageoptim do |image_optim|
    image_optim.pngout_options = false # Should disable pngout
  end

  # Use relative URLs
   # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
