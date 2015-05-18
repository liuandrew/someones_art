class CreateAnimations < ActiveRecord::Migration
  def change
    create_table :animations do |t|
      t.string :name
      t.text :description
      t.string :video
      t.string :cloudinary_url
      t.timestamps null: false
    end
  end
end
