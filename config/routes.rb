Rails.application.routes.draw do
  get "/contacts/:type", to: "contacts#index"
  resources :contacts
  # root to: '#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
