class RemoveCloudinaryFromAnimations < ActiveRecord::Migration
  def change
  	remove_column :animations, :cloudinary_url
  	remove_column :animations, :video
  	add_column :animations, :youtube_id, :string
  end
end
