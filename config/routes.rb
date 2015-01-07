Threeout::Application.routes.draw do
  resources :comments
  resources :videos
  resources :posts

  devise_for :users, path_names: { sign_in: "login", sign_out: "logout"}, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  get '/', to: 'top#show'
  get '/v/:youtube_id', to: 'top#show'
  get '/like/:video_id', to: "likes#create"
  get '/who/:video_id', to: "likes#who"
  resources :questions
  resources :videos
  resources :comments

  get '/secret', to: 'users#secret'
  get '/secret2/:username', to: 'users#secret2'
  get '/secret3', to: 'users#secret3'
  get '/secret2/:username', to: 'users#secret2'

  get '/:username', to: 'top#show'
  get '/:username/:youtube_id', to: 'top#show'

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
