Merb.logger.info("Compiling routes...")
Merb::Router.prepare do
  resources :reviews
  authenticate do
    match('/').to(:controller => 'front', :action => 'index')

    resources :books
    resources :locations
    resources :authors
    resources :publishers
  end

  # Adds the required routes for merb-auth using the password slice
  slice(:merb_auth_slice_password, :name_prefix => nil, :path_prefix => "")
end