Rails.application.assets.register_engine('.slim', Slim::Template)


Rails.application.config.assets.enabled = true
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( blogs.js manage_blog.js blog.css facebox/loading.gif )
