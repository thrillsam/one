Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login', to: "login#new"
  post 'login', to: "login#create"
  delete 'logout', to: "login#destroy"
  resources :users
  root "login#new"
end
