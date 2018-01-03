require "rails_helper"
require "spec_helper"

RSpec.feature "Showing as article" do 

	before do
		@article = Article.create(title: "The first article", body: "Lorem ipsum dolor sit amet, consecteture.")
	end

	scenario "A user shows an article" do

		visit "/"
		click_link @article.title
	end

	expect(page).to have_content(@article.title)
	expect(page).to have_content(@article.body)

end
