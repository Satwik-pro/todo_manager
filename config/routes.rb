Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/", to: "home#index"
  resources :todos
  resources :users
  post "users/login", to: "users#login"
end

# sudo service postgresql start
# rails generate scaffold db_name coloumn_name
# rails db:migrate
# rails console
