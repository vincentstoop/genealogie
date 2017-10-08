class Contact < ApplicationRecord
  has_dynamic_attributes
  # before_save create_model_class(data[:type], data)
  
  # def initialize(data)
  #     create_model_class if !(data[:klaas] == self)
  #     debugger
  # end
  
  def self.create_model_class(klass_name, klass_vars)
    klass = Object.const_set(klass_name, Class.new(Contact))
    klass.class_eval do
      # has_dynamic_attributes
      define_method(:initialize) do |params|
        super(params)
        klass_vars.keys.each_with_index do |name, i|
          instance_variable_set("@"+name[i], name[i])
        end
      end
    end
    return klass
  end
  
  # def self.find
  #   find.where(klaas: !("Vin"))
  # end
  
  # def to_param
  #   uri = "#{id}-#{name}"
  #   debugger
  # end
end
