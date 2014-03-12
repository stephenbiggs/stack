class AddIpAddressToVotes < ActiveRecord::Migration
  def change
  	# add a field to store ip address to stop multivoting
  	add_column :votes, :ip_address, :string
  end
end
