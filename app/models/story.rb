class Story < ActiveRecord::Base


	# lests make the code know that there's a relationship
	# between story and comment

	has_many :comments


	# another relationship between story and votes
	has_many :votes



	# lets make sure our data in our database
	# is exactly what we want it to be

	validates :title, presence: true, length: { minimum: 5, message: "Must be at least 5 characters long" }
	validates :link, presence: true, uniqueness: true

	# validates ()
	# :title is a symbol because it doesnt change within the code
	# { presence: true } is a hash
	# validates(:title, { presence: true })

	# hash example
	# @teacher = { name: "Rik", gender: "male" }


end
