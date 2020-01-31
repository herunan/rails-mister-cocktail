Rails.application.routes.draw do
  get 'reviews/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'
  resources :cocktails, only: %i[show new create] do
    resources :doses, only: %i[new create destroy]
    resources :reviews, only: :create
  end
end
