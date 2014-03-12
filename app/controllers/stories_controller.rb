class StoriesController < ApplicationController

	# to add a page to my site
	# lets add the index page
	def index
		# in here lives all the code for the index page
		@username = "Stephen"

		# to make a list we use square brackets
		# @stories = ["Google", "Facebook", "Twitter", "Linkedin", "Foursquare"]

		# so now we want to get out data from the database
		# order by the most voted then if same, latest first
		# @stories = Story.order("votes_count desc, created_at desc")

		# if the url has extra parameters, mainly sort equals recent
		# then order by created_at desc
		# if the filter equals featured, then just get the is_featured true stories
		# else just do the usual stuff

		if params[:sort] == "recent"
			# double equals means compare two things together
			# sort by most recent
			@stories = Story.order("created_at desc")

		elsif params[:filter] == "featured"

			# just get the featured ones
			@stories = Story.where(is_featured: true).order("title asc")
			

		else
			# sort by most voted
			@stories = Story.order("votes_count desc, created_at desc")
		end


	end



	# show me an individual story page
	def show
		# params[:id] is from the URL, eg. if /stories/7
		# then params[:id] is 7
		@story = Story.find(params[:id])
	end



	# this is going to be the "adding a new story form" page
	def new
		# make @story be a blank story, ready to be filled in
		@story = Story.new
	end



	# new and create work together as a pair
	# the create action actually adds things to the database
	def create
		
		# make @story be a blank story but with fields filled in
		@story = Story.new(story_params)

		# save this story to the database IF THE VALIDATIONS PASS
		# if they dont pass show the form with errors
		if @story.save

			# lets add a notification to our user to let them know it
			# has been saved to the database
			flash[:success] = "Yay, you've submitted a story"

			# lets make this go back to the homepage
			redirect_to root_path

		else
			# if the story DOESN'T save, do this
			# show the new.html.erb form with errors
			render "new" # not redirect. render keeps the errors and form data already completed

		end
	end



	# i want to show the edit form for an individual story
	def edit
		# lets find the story based on the url
		@story = Story.find(params[:id])
	end



	# i want to update the database with the updated data
	def update
		@story = Story.find(params[:id])

		# update the record with the form data IF IT VALIDATES
		if @story.update(story_params)

			# let the user know
			flash[:success] = "You've updated the story"

			# lets make this go back to the story page
			redirect_to story_path(@story)

		else

			# if it doesn't update, show the edit form with errors
			render "edit" # not redirect. render keeps the errors and form data already completed

		end
	end


	# lets destroy this story

	def destroy
		@story = Story.find(params[:id])

		@story.destroy

		flash[:success] = "You've deleted the story"

		redirect_to root_path
	end



	# i want to get the right data from the form
	def story_params
		# only get the title, desc and link from the story params
		params.require(:story).permit(:title, :description, :link)
	end

end
