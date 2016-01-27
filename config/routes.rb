Rails.application.routes.draw do
  resources :articles
  get '/articles/:id/destroy', to: 'articles#destroy'
  get '/errorPage', to: 'articles#errorPage'
  root "articles#index"
end
