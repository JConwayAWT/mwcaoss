class CreateEmploymentApplications < ActiveRecord::Migration
  def change
    create_table :employment_applications do |t|
      t.string :name
      t.string :business_name
      t.text :address
      t.string :telephone
      t.string :email
      t.text :current_sop_details
      t.string :how_did_you_hear

      t.timestamps
    end
  end
end
