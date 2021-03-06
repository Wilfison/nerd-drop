Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'

  get :searcher, to: 'home#searcher'

  resources :categories, only: :show
  resources :scraper, only: :index
end
