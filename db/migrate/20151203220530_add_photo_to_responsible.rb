class AddPhotoToResponsible < ActiveRecord::Migration
  def change
  	add_attachment :responsibles,:photo
  end
end
