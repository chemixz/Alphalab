class CreateProyectFiles < ActiveRecord::Migration
  def change
    create_table :proyect_files do |t|
      t.string :name
      t.string :url_img
      t.string :format_img
      t.references :proyect, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
