class Contact < ApplicationRecord
  has_dynamic_attributes
  # before_save create_model_class(data[:type], data)
  
  # def initialize(data)
  #     create_model_class if !(data[:klaas] == self)
  #     debugger
  # end
  
  def self.create_model_class(klass_name, klass_vars)
    klass = Object.const_set(klass_name, Class.new(Contact))
    # debugger
    klass.class_eval do
      # has_dynamic_attributes
      define_method(:initialize) do |params|
        super(params)
          klass_vars.keys.each_with_index do |name, i|
              instance_variable_set("@"+name[i], name[i])
          end
      end
      # debugger
    end
    return klass
  end
end
