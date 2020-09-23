Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bloggers, only: [:index, :new, :create, :show]
  resources :destinations, only: [:index, :show]
  resources :posts, only: [:new, :create, :edit, :update, :show, :index]

  post '/posts/:id', to: "posts#add_like", as: 'new_like'
end
