class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :create_classes#, except: [:index]
  
  def create_classes
    # debugger
    
    model_names = []
    @dynamic_models = []
    # Contact.all.select(:klaas).each { |model_name| name << model_name.klaas }
    Contact.all.select(:klaas).each do |model_name|
      # Add all the model_names to an array, so we can create classes from them
      model_names.push model_name.klaas
      model_names.uniq!
    end
    
    # We only want to create a model once for each model_name
    model_names.each do |dynamic_model|
      @dynamic_models.push Contact.create_model_class dynamic_model, Contact.find_by_klaas(dynamic_model)
    end
    
  end
end
