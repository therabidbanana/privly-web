Privly::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # The test environment is used exclusively to run your application's
  # test suite.  You never need to work with it otherwise.  Remember that
  # your test database is "scratch space" for the test suite and is wiped
  # and recreated between test runs.  Don't rely on the data there!
  config.cache_classes = true

  # Configure static asset server for tests with Cache-Control for performance
  config.serve_static_assets = true
  config.static_cache_control = "public, max-age=3600"

  # Log error messages when you accidentally call methods on nil
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Raise exceptions instead of rendering exception templates
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in test environment
  config.action_controller.allow_forgery_protection    = false

  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  config.action_mailer.delivery_method = :test

  # Use SQL instead of Active Record's schema dumper when creating the test database.
  # This is necessary if your schema can't be completely dumped by the schema dumper,
  # like if you have constraints or database-specific column types
  # config.active_record.schema_format = :sql

  # Print deprecation notices to the stderr
  config.active_support.deprecation = :stderr

  # Allow pass debug_assets=true as a query parameter to load pages with unpackaged assets
  config.assets.allow_debugging = true
  
  # Set this variable to change the displayed name of the site.
  config.name = "test"
  
  # Users with the "can_post" permission will be able to create posts lasting
  # this long
  config.user_can_post_lifetime_max = 30.days
  
  # Users without the "can_post" permission will be able to create posts
  # lasting this long. Also, their posts will not be tied to their user account
  config.user_cant_post_lifetime_max = 14.days
  
  # Users who are not logged in will be able to create posts lasting this long
  config.not_logged_in_lifetime_max = 3.days
  
  # Turns on domain redirection to the primary domain set below
  config.redirect_html_requests_to_root_domain = true
  
  # Set the primary host domain.
  # HTML format requests are checked in
  # the application controller for this domain. If this domain
  # is not present, the request is redirected to the same resource
  # on this domain.
  config.primary_domain_host = "test.host"
  
  # This is the domain to redirect users to if they are viewing the 
  # HTML version of the site and the request came from a different domain.
  # Ports are optionally included.
  config.primary_domain_redirect = "test.host"
  
  # The host new injectible links should be created on.
  # If you don't know what you are doing here, you should set
  # it to the same domain as the primary_domain_host
  config.link_domain_host = "test.host"
  
  config.action_mailer.default_url_options = { :host => 'localhost' }
  
end
