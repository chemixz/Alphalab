class CreateResponsibles < ActiveRecord::Migration
  def change
    create_table :responsibles do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :address

      t.timestamps null: false
    end
  end
end
