module ContactsHelper
    
    def dynamic_attribute_inputs(form, model)
        inputs = model.dynamic_attributes.map do |attr|
            options = {
                label: attr.display_name,
                as: datatype_mapping(attr.datatype)
            }
            form.input attr.name, options
        end

        safe_join inputs
    end
    
    def datatype_mapping(type)
        case type
            when ActiveDynamic::DataType::Text then :text
            when ActiveDynamic::DataType::Integer then :integer
            else :string
        end
    end
    
    # Generate dynamic paths
    def all_instances_path model
      Rails.application.routes.url_helpers.send("#{model.klaas.downcase.pluralize}_path")
    end
    
    def instance_path model
      Rails.application.routes.url_helpers.send("#{model.klaas.downcase}_path", model)
    end
    
    def new_instance_path model
      Rails.application.routes.url_helpers.send("new_#{model.klaas.downcase}_path")
    end
    
    def edit_instance_path model
      Rails.application.routes.url_helpers.send("edit_#{model.klaas.downcase}_path", model)
    end
end
