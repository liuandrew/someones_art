class CreateDrawings < ActiveRecord::Migration
  def change
    create_table :drawings do |t|
    	t.string :name
    	t.text :description
    	t.text :image_url
      t.timestamps null: false
    end
  end
end
