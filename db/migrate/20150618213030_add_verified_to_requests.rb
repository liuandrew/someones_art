class AddVerifiedToRequests < ActiveRecord::Migration
  def change
  	add_column :requests, :verified, :boolean, default: false
  end
end
