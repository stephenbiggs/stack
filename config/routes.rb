Stack::Application.routes.draw do

  # Activeadmin added its own URLs to the site
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # i want to set up all of the urls for the
  # stories controller
  # this is a shortcut for adding SEVEN different actions
	# REST is a way to alter and view data, the seven actions are:
	# index, show, new, create, edit, update, destroy
	resources :stories do
    # inside the stories, we have a nested resource
    # which is a relationship between stories and comments
    resources :comments

    # inside the stories we have another nested resource
    # which is a relationship between stories and votes
    resources :votes
  end
	# new_story_path		--> stories#new
	# edit_story_path		-->	stories#edit
	# story_path 				--> stories#show
	# stories_path 			--> stories#index

  # new_story_comment_path    --> comments#new
  # edit_story_comment_path   --> comments#edit
  # story_comment_path        --> comments#show
  # story_comments_path       --> comments#index


  # to see all of the URLS across the site,
  # cancel out of the rails server and we can tyoe in
  # rake routes



  # set up my homepage to go to the stories controller
  # and show the index page

  root "stories#index"


end
