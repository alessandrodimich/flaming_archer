Rproj::Application.routes.draw do

  get "events/index"

  get "password_resets/new"

  root to: "home#welcome"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]

  get 'signup', to: 'users#new', as: 'signup' #equivalent to: match '/signup',  to: 'users#new'
  get 'login', to: 'sessions#new', as: 'login' #equivalent to: match '/login',  to: 'sessions#new'
  get 'logout', to: 'sessions#destroy', as: 'logout' #equivalent to: match '/logout',  to: 'sessions#destroy'
  #get 'welcome', to: 'home#welcome', as: 'welcome'
  get 'index', to: 'home#index', as: 'index'
  get 'prova', to: 'home#prova', as: 'prova'
  get 'test',  to: 'home#test', as: 'test'
  get 'map',  to: 'home#map', as: 'map'
  get 'events', to: 'events#index', as: 'events'
  get 'starter', to: 'home#starter', as: 'starter'






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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
