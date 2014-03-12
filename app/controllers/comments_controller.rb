class CommentsController < ApplicationController

	# this controller only needs new and create
	# because we don't want users to edit, delete or view a list

	def new

		# we need to find which story we're talking about
		# and we need to make a new comment on that story

		# we dont want the params[:id] because that is
		# talking about a comment NOT A STORY

		# we can get the params[:story_id] from the URL though
		@story = Story.find(params[:story_id])
		@comment = @story.comments.new		

	end


	# actually create the comment on the story

	def create
		# same line as in "new"
		@story = Story.find(params[:story_id])
		@comment = @story.comments.new(comment_params)

		# just like with the story controller
		# if the comment is saved, show a message then re-direct
		# else show the error page

		if @comment.save
			flash[:success] = "Your comment has been posted"
			redirect_to story_path(@story)

		else
			render "new"
		end

	end


	# lets make a shortcut for whitelisting our form data
	def comment_params
		# params is always sent through with rails
		# make sure there's a comment in it
		# and only allow the body field in case of hackers
		params.require(:comment).permit(:body)
	end



end
