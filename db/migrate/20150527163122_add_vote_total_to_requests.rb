class AddVoteTotalToRequests < ActiveRecord::Migration
  def change
  	add_column :requests, :vote_total, :integer
  end
end
