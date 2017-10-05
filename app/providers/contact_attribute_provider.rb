class ContactAttributeProvider
    
    def initialize(model)
        @model = model
    end
    
    def call
        # [
    #   ActiveDynamic::AttributeDefinition.new('age', datatype: ActiveDynamic::DataType::Integer, default_value: 18),
    #   ActiveDynamic::AttributeDefinition.new('description')
    # ]
        ContactAttribute.all.map do |attr|
          ActiveDynamic::AttributeDefinition.new(
            attr.name, datatype: attr.datatype, 
            required: attr.required?)
        end 
    end
end
