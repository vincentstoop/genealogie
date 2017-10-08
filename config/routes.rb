Rails.application.routes.draw do
  # get all dynamic_models
  @model_symbols = []
  models = Contact.all.select(:klaas)

  models.each do |model_name|
    @model_symbols << model_name.klaas.split(" ").join("_").downcase.pluralize.to_sym
    @model_symbols.uniq!
  end
  
  # get "/contacts/:type", to: "contacts#index"
  scope '/contacts' do
    @model_symbols.each do |model_symbol|
      resources model_symbol, controller: 'contacts', as: model_symbol
    end
  end
  get "contacts/:type", to: "contacts#index"
  get "contacts/:type/:id", to: "contacts#show"
  get "contacts/:type/:id/edit", to: "contacts#edit"
  resources :contacts do
  end
  # root to: '#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
