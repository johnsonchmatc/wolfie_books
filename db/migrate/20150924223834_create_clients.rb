class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :contact_name
      t.string :phone
      t.string :contact_email
      t.string :street
      t.string :city
      t.string :state
      t.string :postal_code

      t.timestamps null: false
    end
  end
end
