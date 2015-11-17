class AddPhotoToPatientes < ActiveRecord::Migration
  def change
  	add_attachment :patients, :photo
  end
end
