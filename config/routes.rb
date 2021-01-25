Rails.application.routes.draw do
  resources :construction_expenses
  resources :expenses
  resources :invens
  # resources :collections
  resources :collections do
    collection do
      get 'update_families', to: "collections#update_families"
    end 
  end
  resources :users
  resources :testpages
  # Set Views/Home/index is the main page
  root 'collections#index'
  get 'home/index', to: 'home#index'
  # get 'collections/update_families', as: 'update_families'
  # get 'collections/show'

  get 'get_family_by_location/:location_id', to: 'collections#get_family_by_location'  
  get '/family_search' => 'collections#family_search'
  
end
