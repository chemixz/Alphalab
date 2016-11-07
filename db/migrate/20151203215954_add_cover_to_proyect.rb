class AddCoverToProyect < ActiveRecord::Migration
  def change
  	add_attachment :proyects,:cover
  end
end
