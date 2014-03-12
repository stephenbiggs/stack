class Vote < ActiveRecord::Base

	# let the vote know about the story its attached to
	# AND let the story keep track of how many votes it has
	belongs_to :story, counter_cache: true

	# what we want to do is check that the ip address is unique
	# for that story
	validates :ip_address, uniqueness: { scope: :story_id }
	# if we had just uniqueness: true that would mean one vote
	# across the whole site per ip address
	# this way we can do one vote per story per ip address

end
