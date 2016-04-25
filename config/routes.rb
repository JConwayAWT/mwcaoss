Rails.application.routes.draw do
  match "/alerts/delete", to: "alerts#delete", via: :get
  resources :alerts

  resources :employment_applications

  resources :contact_requests

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'application#index'

  match "/about", to: "application#about", via: :get
  match "/service_of_process", to: "application#service_of_process", via: :get
  match "research_and_investigation", to: "application#research_and_investigation", via: :get
  match "/court_services", to: "application#court_services", via: :get
  match "/contact", to: "application#contact", via: :get
  match "/careers", to: "application#careers", via: :get
  match "/application_accepted", to: "application#application_accepted", via: :get
  match "/application_rejected", to: "application#application_rejected", via: :get
  match "/delete_alerts", to: "alerts#delete_alerts", via: :post


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
