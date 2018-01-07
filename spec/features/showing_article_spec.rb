require "rails_helper"
require "spec_helper"

RSpec.feature "Showing as article" do 

	before do
		@john = User.create!(email: "john@example.com", password: "password")
		@fred = User.create!(email: "fred@example.com", password: "password")
		@article = Article.create(title: "The first article", body: "Lorem ipsum dolor sit amet, consecteture.", user: @john)
	end

	scenario "A user shows an article" do

	visit "/"
	login_as(@john)
	click_link @article.title
	

	expect(page).to have_content(@article.title)
	expect(page).to have_content(@article.body)
	expect(current_path).to eq(article_path(@article))
	expect(page).to have_link("Edit Article")
	expect(page).to have_link("Delete Article")
	end

	scenario "A non owner hide delete and edit button" do

	visit "/"
	login_as(@fred)
	click_link @article.title
	
	expect(page).to have_content(@article.title)
	expect(page).to have_content(@article.body)
	expect(current_path).to eq(article_path(@article))
	expect(page).not_to have_link("Edit Article")
	expect(page).not_to have_link("Delete Article")
	end
end
