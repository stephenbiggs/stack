# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Story.create(	title: "Reddit", 
							description: "A site for sharing links", 
							link: "http://www.reddit.com")

Story.create(	title: "Google", 
							description: "A massive search engine", 
							link: "http://www.google.com")

Story.create(	title: "Twitter", 
							description: "A site for microblogging", 
							link: "http://www.twitter.com")

Story.create(	title: "Steer", 
							description: "A code school in London", 
							link: "http://www.steer.me")