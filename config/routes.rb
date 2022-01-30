Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  resources :books
  resources :users , only: %i[index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
