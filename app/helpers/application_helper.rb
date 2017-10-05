module ApplicationHelper
  def some_path(some)
    contact_path(some.id, :anchor => "contacts/some/#{some.id}")
  end
  
end
