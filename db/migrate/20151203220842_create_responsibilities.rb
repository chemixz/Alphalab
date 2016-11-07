class CreateResponsibilities < ActiveRecord::Migration
  def change
    create_table :responsibilities do |t|
      t.references :proyect, index: true, foreign_key: true
      t.references :responsible, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
