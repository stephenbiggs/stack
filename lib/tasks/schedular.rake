# this is a task for grabbing code from reddit

task scrape_reddit: :environment do
	
	puts "hiya! i'm about to scrape reddit"

	# this grabs the source code of reddit
	@raw_html = HTTParty.get("http://www.reddit.com")

	## TEST puts "lets get the raw html"
	## TEST puts @raw_html

	# lets turn the raw html into real html we can parse
	@real_html = Nokogiri::HTML(@raw_html)

	## TEST puts "lets check the real html"
	## TEST puts @real_html

	# in css we would style up the title links using div#siteTable a.title
	@real_html.css("div#siteTable a.title").each do	|link|

	## TEST	puts link
	## TEST puts "----"

		# this is similar to the stories/index.erb view
		# <a href="THELINK">THE TITLE OF THE STORY</a>

		@story = Story.new
		@story.title = link.text
		@story.link = link[:href]
		@story.save

	end

end