Merb.logger.info("Compiling routes...")
Merb::Router.prepare do
  authenticate do
    match('/').to(:controller => 'front', :action => 'index').name(:front)

    match('/search').to(:controller => 'search', :action => 'index').name(:search)

    resources :items
    resources :locations
    resources :authors
    resources :publishers
    resources :reviews
  end

  # Adds the required routes for merb-auth using the password slice
  slice(:merb_auth_slice_password, :name_prefix => nil, :path_prefix => "")
end