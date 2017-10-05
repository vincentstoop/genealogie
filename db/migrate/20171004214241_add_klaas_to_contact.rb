class AddklaasToContact < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :klaas, :string
  end
end
