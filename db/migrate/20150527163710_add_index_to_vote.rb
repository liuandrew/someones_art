class AddIndexToVote < ActiveRecord::Migration
  def change
  	add_index :votes, :request_id
  end
end
