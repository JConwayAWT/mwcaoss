class CreateContactRequests < ActiveRecord::Migration
  def change
    create_table :contact_requests do |t|
      t.string :name
      t.string :company
      t.text :address
      t.string :email
      t.string :telephone
      t.string :best_time_to_contact
      t.text :inquiry_details

      t.timestamps
    end
  end
end
