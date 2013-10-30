MovieShare::Application.routes.draw do

<<<<<<< HEAD
  resources :movielists


     get "pages/profile"
    #get 'pages' => 'pages#mainpage'
=======
  resources :followers
>>>>>>> 85c3c9cfcef9ed2f2634cb68d538bbfd81c3f452


  controller :login do               #added by Simon due to login context:
    get 'login' => :new              #user clicks button with Submit_tag 'Logi
    post 'login' => :create          #and the function 'create' in login_contr
    delete 'logout' => :destroy
  end

  controller :pages do 
    post 'pages/mainpage' => :getmovie
    post 'pages/list' => :getmovie
  end

  get "login/new"

  get "users/new"
  resources :users
  resources :movies

  get "pages/profile"

  get "pages/mainpage"

  get "pages/profilepage"

  get "pages/loginpage"

  get "pages/moviepage"

  get "pages/registerpage"

  get "pages/list"

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

