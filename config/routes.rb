Rails.application.routes.default_url_options[:host] = "localhost"
Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'passengers#index'
  resources :passengers

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users, only: [:show]
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
