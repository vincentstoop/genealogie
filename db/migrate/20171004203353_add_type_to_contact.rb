class AddTypeToContact < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :type, :string
  end
end
