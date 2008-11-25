Merb.logger.info("Compiling routes...")
Merb::Router.prepare do
  resources :authors
  resources :publishers
  resources :books
  
  # Adds the required routes for merb-auth using the password slice
  slice(:merb_auth_slice_password, :name_prefix => nil, :path_prefix => "")
  
  match('/').to(:controller => 'front', :action => 'index')
end