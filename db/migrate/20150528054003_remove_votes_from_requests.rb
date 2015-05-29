class RemoveVotesFromRequests < ActiveRecord::Migration
  def change
  	remove_column :votes, :request
  end
end
