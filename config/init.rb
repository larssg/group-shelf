# Go to http://wiki.merbivore.com/pages/init-rb
 
require 'config/dependencies.rb'
 
use_orm :datamapper
use_test :rspec
use_template_engine :haml
 
Merb::Config.use do |c|
  c[:use_mutex] = false
  c[:session_store] = 'cookie'  # can also be 'memory', 'memcache', 'container', 'datamapper
  
  # cookie session store configuration
  c[:session_secret_key]  = '191d0c08bbdbcf38a37a63fbfa20aa8c3c5bd9c5'  # required for cookie session store
  c[:session_id_key] = '_group_self_session_id' # cookie session id key, defaults to "_session_id"
end

require Merb.root / :config / :providers 

Merb::BootLoader.before_app_loads do
  require Merb.root / :lib / :providers / :amazon
  require Merb.root / :lib / :providers / :saxo

  Merb::Config.use do |c|
    c[:book_providers] = [GroupShelf::Amazon, GroupShelf::Saxo]

    c[:amazon_api_key] = '052GMKZBEM7FCJAXKN82'
    c[:saxo_api_key] = 'b4af53baa2e546bc'
  end
end
 
Merb::BootLoader.after_app_loads do
end