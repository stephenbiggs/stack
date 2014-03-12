class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|

    	# add columns to the database table
    	t.string :title
    	t.string :description
    	t.string :link

      t.timestamps
    end
  end
end
