module ApplicationHelper  
  def some_path(some)
    # We want the route to be something like "/contacts/modelname/id"
    "/#{path_base(some)}/#{some.klaas.underscore.downcase}/#{some.id}"
  end
  
  def some_edit_path(some)
    "/#{path_base(some)}/#{some.klaas.downcase}/#{some.id}/edit"
  end
  
  def delete_some_path(some)
    # We want the route to be something like "/contacts/modelname/id"
    "#{path_base(some)}/#{some.id}"
  end

  private
    def path_base(some)
      Contact.create_model_class(some.klaas, some).superclass.name.underscore.pluralize
    end
end
