class ClassConstruction
    
    # def initialize(model)
    #     klass = Class.new(model) do
    #         ATTRIBUTES = attributes
    #         attr_accessor *ATTRIBUTES
    # 
    #         def initialize(*args)
    #             raise ArgumentError, "Too many arguments" if args.size > ATTRIBUTES.size
    #             ATTRIBUTES.zip(args) do |attr, val|
    #                 send "#{attr}=", val
    #             end
    #         end
    #     end
    # end
end
