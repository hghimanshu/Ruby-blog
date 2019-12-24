Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  resources :articles, only: [:index, :new] do
    resources :comments, only: [:index, :create]
  end
end
