PHA::Application.routes.draw do

  resources :equipment

  resources :offices
#Custom server routes. list_ood lists out of date, list_utd lists up to date, and associate is for adding associations with softwares.
  match '/servers/list_ood', :controller => 'servers', :action => 'list_ood', :as => "ood_servers"
  match '/servers/list_utd', :controller => 'servers', :action => 'list_utd', :as => "utd_servers"
  #match '/servers/:server_id/associate', :controller => 'servers', :action => 'associate', :as => "associate_software"

  match '/softwares/list_ood', :controller => 'softwares', :action => 'list_ood', :as => "ood_softwares"
  match '/softwares/list_utd', :controller => 'softwares', :action => 'list_utd', :as => "utd_softwares"

  resources :servers do
    get :associate, :on => :member
    get :addassociation, :on => :member
    get :disassociate, :on => :member
    resources :softwares 
  end

  resources :softwares do
    get :associate, :on =>  :member
    get :addassociation, :on => :member
    get :disassociate, :on => :member
    resources :servers
  end

  get "home/index"
  #match ':servers/:server_id/:softwares/:id/edit' => 'softwares#edit'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"
  #map.connect '/software/edit', :controller => 'software', :action => 'edit'



  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
