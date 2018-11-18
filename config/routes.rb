Rails.application.routes.draw do
  resources :coins

  match '/signin', to: 'account#signin', via: 'get'
  match '/signout', to: 'account#signout', via: 'get'
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
end
