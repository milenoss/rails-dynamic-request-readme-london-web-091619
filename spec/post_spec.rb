
require 'capybara'
require 'rails_helper'

describe 'navigate' do
  before do
    @post = Post.create(title: "My Post", description: "My post desc")
    @session = Capybara::Session.new
  end

  it 'loads the show page' do
    @session.visit "/posts/#{@post.id}"
    expect(page.status_code).to eq(200)
  end

  it 'shows the title on the show page in an h1 tag' do
    @session.visit "/posts/#{@post.id}"
    expect(page).to have_css("h1", text: "My Post")
  end

  it 'shows the description on the show page in a p tag' do
    @session.visit "/posts/#{@post.id}"
    expect(page).to have_css("p", text: "My post desc")
  end
end