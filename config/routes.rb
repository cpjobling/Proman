ActionController::Routing::Routes.draw do |map|
<<<<<<< HEAD:config/routes.rb
  map.resources :news_articles

  
  map.root :controller => "home", :action => 'index'

  map.resources :users

  map.resource :session

  
  map.connect 'projects/by_supervisor', 
    :conditions => { :method => :get },
    :controller => "projects",
    :action => "by_supervisor"
    
  map.connect 'projects/by_discipline', 
    :conditions => { :method => :get },
    :controller => "projects",
    :action => "by_discipline"
    
  map.connect 'projects/by_centre', 
    :conditions => { :method => :get },
    :controller => "projects",
    :action => "by_centre"
    
  map.connect 'my_projects', 
    :conditions => { :method => :get },
    :controller => "projects",
    :action => "my_projects"
    
  map.connect 'allocate',
    :conditions => { :method => :put },
    :controller => "projects",
    :action => "allocate"
    
  map.resources :projects
  

  map.resources :students
 
  
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login '/login', :controller => 'session', :action => 'new'
  map.logout '/logout', :controller => 'session', :action => 'destroy'
  
  map.gate '/gate', :controller => 'gate', :action => 'index'
=======

 

  map.connect 'projects/by_supervisor',
    :conditions => { :method => :get },
    :controller => "projects",
    :action => "by_supervisor"

  map.connect 'projects/by_discipline',
    :conditions => { :method => :get },
    :controller => "projects",
    :action => "by_discipline"

  map.connect 'projects/by_centre',
    :conditions => { :method => :get },
    :controller => "projects",
    :action => "by_centre"

  map.connect 'my_projects',
    :conditions => { :method => :get },
    :controller => "projects",
    :action => "my_projects"

  map.resources :projects

  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.resources :users

  map.resource :session
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:config/routes.rb

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
<<<<<<< HEAD:config/routes.rb
=======
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:config/routes.rb

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
<<<<<<< HEAD:config/routes.rb
  # map.root :controller => "welcome"
=======
  map.root :controller => "welcome"
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:config/routes.rb

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
<<<<<<< HEAD:config/routes.rb
=======
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:config/routes.rb
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
