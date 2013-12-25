Oatoebs::Application.routes.draw do

	get "evs/index"
	get "ats/index"
	get "dds/index"
	get "dds/show"
	get "dg/index"
	get "dg/show"
	get "gls/index"
	get "gls/rep_patch_result"
	get "gls/rep_tr_span"
	get "tss/index"
	get "tss/show"
	get "tss/monitor"
	get "fns/index"
	get "fns/new"
	get "fns/show"
	get "obs/index"
	get "obs/show"
	get "trs/index"
	get "trs/show"
	get "fms/index"
	get "fms/show"
	get "fms/edit"
	post "fns/create"
	post "fns/find_all"
	
	
	match '/find_tr', to: 'fns#find_tr', via: [:post]
	match '/find_tr_ev', to: 'fns#find_tr_ev', via: [:post]
	match '/find_tr_act', to: 'fns#find_tr_act', via: [:post]
	match '/find_tr_op', to: 'fns#find_tr_op', via: [:post]
	match '/find_function', to: 'tss#find_function', via: [:post]
	match '/create_suite', to: 'tss#create_suite', via: [:post]
	match '/create_script', to: 'tss#create_script', via: [:post]
	match '/create_step', to: 'tss#create_step', via: [:post]
	match '/create_arg_instance', to: 'tss#create_arg_instance', via: [:post]
	match '/fms/show', to: 'fms#show', via: [:post]
	match '/fns/delete/:id', to: 'fns#destroy', via: [:get], as: 'fns_delete'
	match '/tss/get_steps/:id', to: 'tss#get_steps', via: [:get], as: 'get_steps'
	match '/tss/get_form/:form', to: 'tss#get_form', via: [:get], as: 'get_form'
	match '/tss/destroy_script/:script', to: 'tss#destroy_script', via: [:post], as: 'destroy_script'
	match '/tss/destroy_suite/:suite', to: 'tss#destroy_suite', via: [:get], as: 'destroy_suite'
	root 'tss#monitor'
	
  #resources :fms, :trs, :obs, :fns, :tss
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
