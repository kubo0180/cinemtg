Simple::Application.routes.draw do

  get "service/item"

  get "rlog/index"

  get "rlog/show"

 match "service/match"
match "service/like"
match "service/talk"
match "service/setting"

  resources :books do
    resources :entries
  end

  resources :blog, :only=>[:index, :show] do end
  match "blog/entries/:id/:entry_id/" => "blog#show", :as => :blog_show
  match "blog/entries/:id/" => "blog#index", :as => :blog_index
  match "amazon/" => "amazon#index"

  match "rlog/books/:id/:book_id/" => "rlog#show",  :as => :rlog_show
  match "rlog/books/:id/" => "rlog#index", :as => :rlog_index

  match '/auth/:provider/callback' => 'sessions#callback'
  match "/signout" => "sessions#destroy",  :as => :signout
  resources :entries, :only=>[:index, :new, :create, :show, :update, :edit, :destroy] do
    resources :comments, :only=>[:new, :create]
  end

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
  root :to => 'entries#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
