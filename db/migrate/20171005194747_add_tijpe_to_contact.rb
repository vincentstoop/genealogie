class AddTijpeToContact < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :tijpe, :string
  end
end
