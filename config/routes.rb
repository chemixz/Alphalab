Rails.application.routes.draw do

  post "/search" ,to: "proyects#search" , as: 'search'
  get "/search" ,to: "proyects#index"

  resources :proyect_files
  resources :categories
  resources :responsibles
  resources :responsibilities
  resources :proyects
  devise_for :users 
 
 
  get "/dashboard" ,to: "welcome#dashboard"
  #resources :userstwo, only: [:index,:show,:edit,:update,:destroy]

  
  get "/cusers" ,to: "users#index" , as: 'users'
  get "/cusers/:id" ,to: "users#show" , as: 'user'
  get "/cusers/:id/edit" ,to: "users#edit" , as: 'edit_user'
  delete "cusers/:id" , to: "users#destroy"
  patch "/cusers/:id" , to: "users#update"

  put "/proyects/:id/finish_it", to: "proyects#finish_it"
  get 'welcome/index'
  root 'proyects#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
