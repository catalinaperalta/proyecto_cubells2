Rails.application.routes.draw do

  get 'sessions/new'

  root 'sessions#new'

  get 'materiasAlumno' => 'alumnos#show'
  # get 'show' => 'alumnos#show'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  post 'materia' => 'alumnos#create'

  get 'alumnos/boleta/:id' => 'alumnos#boleta', :as => :alumnos_boleta

  get 'directors/listaa/:id' => 'directors#listaa', :as => :directors_listaa
  get 'directors/listam/:id' => 'directors#listam', :as => :directors_listam

  get 'materia_profesors/listaap/:id' => 'materia_profesors#listaap', :as => :materia_profesors_listaap

  resources :cursos

  resources :materia_profesors

  resources :alumnos

  resources :materia_alumnos

  resources :profesors

  resources :parcials

  resources :materia

  resources :materia_carreras

  resources :impartes

  resources :directors

  resources :cursars

  resources :carreras

  resources :actividads

  match ":url" => "application#direccion_mala", :constriants => {:url => /.*/}, via: [:get, :post]

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
