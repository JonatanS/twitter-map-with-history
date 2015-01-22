Rails.application.routes.draw do
  get 'location_tweets/get_tweets'
  get 'twitter_apps/index'

  get 'twitter_apps/history'

  resources :search_histories
  

  get 'twitter_apps/(:id)' => 'twitter_apps#index'#, as: :twitter_apps

  
  get 'tweets_as_json', to: 'location_tweets#get_tweets', as: :get_tweets

  root to: 'twitter_apps#index'

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

end
