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
end
