class CreateContactAttributesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_attributes do |t|
      t.string :name
      t.string :datatype
      t.boolean :required
    end
  end
end
