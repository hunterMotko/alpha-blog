Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'
  # need only if your trying to using certain routes
  # resources :articles, only: %i[show index new create edit update destroy]
  # now we can use
  resources :articles
end
