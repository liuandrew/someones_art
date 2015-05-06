class AddCloudinaryUrlToDrawing < ActiveRecord::Migration
  def change
  	add_column :drawings, :cloudinary_url, :string
  end
end
