Rails.application.routes.draw do
  resources :articles
  get '/articles/:id/destroy', to: 'articles#destroy'
  root "articles#index"
end
