class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :phone_number
      t.text :project_description

      t.timestamps
    end
  end
end
