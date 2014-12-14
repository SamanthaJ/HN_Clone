require 'rails_helper'

feature 'home page' do 
  before :each do
    @user = create(:user)

    log_in
  end

  scenario 'displays home page' do

    expect(page).to have_content('Submit a link')
  end 

  scenario "displays create-post form" do 
    click_link 'Submit a link'

    expect(page).to have_button ('Create Post')
  end 

  scenario "creates new post" do 
    click_link 'Submit a link'
    fill_in 'Title', with: 'post title'
    fill_in 'Link', with: 'www.link.com'
    click_button 'Create Post'

    expect(page).to have_content('Post was successfully created.')
  end
end

feature 'show page/adding comments' do 
  before :each do
    @user = create(:user)

    log_in
  end
  scenario "adds a comment" do 
    
    find('.comments-button').click
    click_link 'Submit a comment'
    fill_in 'Comment', with: 'post comment'
    click_button 'Create Comment' 

    expect(page).to have_content('post comment')
  end
end


def log_in
  visit root_path
  click_link 'Sign in'
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Log in'
end
