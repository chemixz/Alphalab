class CreateProyects < ActiveRecord::Migration
  def change
    create_table :proyects do |t|
      t.string :title
      t.text :body
      t.datetime :start_date
      t.datetime :finish_date
      t.string :state , default: "in_draft"
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
