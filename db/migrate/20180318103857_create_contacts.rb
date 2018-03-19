class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :phone_number
      t.string :street_name
	  t.string :street_number
	  t.string :zipcode
	  t.string :city
	  t.string :country
      t.timestamps null: false
    end
  end
end
