require 'rails_helper'

feature 'HN Clone' do
  before :each do
    @user = create(:user)
    log_in
  end

  scenario 'displays home page' do

    expect(page).to have_content('Submit a link')
  end

  scenario "creates new post" do
    create_post

    expect(page).to have_content('successfully created')
  end

  scenario "creates new comment" do
    create_post
    click_link 'Submit a comment'
    @comment = build(:comment)
    fill_in 'Comment', with: '@comment.body'
    click_button 'Create Comment'

    expect(page).to have_content('successfully created')
  end
end

def log_in
  visit root_path
  click_link 'Sign in'
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Log in'
end

def create_post
  click_link 'Submit a link'
  @post = build(:post)
  fill_in 'Title', with: '@post.title'
  fill_in 'Link', with: '@post.link'
  click_button 'Create Post'
end
