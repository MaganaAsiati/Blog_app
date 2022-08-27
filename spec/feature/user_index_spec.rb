require 'rails_helper'

RSpec.describe 'Testing user index page', type: :feature do
  describe 'User' do
    before(:each) do
      @first_user = User.create(Name: 'John', Photo: 'profile.jpg', Bio: 'Developer.')
      @second_user = User.create(Name: 'Sarah', Photo: 'profile.jpg', Bio: 'Web Developer.')
      @second_user = User.create(Name: 'Tobin', Photo: 'profile.jpg', Bio: 'Frontend Developer.')

      @first_post = Post.create(author_id: @first_user.id, Text: 'post text', Title: 'post title')
      @first_post.save
    end
    feature 'User Index page' do
      background { visit users_path }

      scenario ' I can see the username of all other users.' do
        expect(page).to have_content('John')
        expect(page).to have_content('Sarah')
        expect(page).to have_content('Tobin')
      end

      scenario 'See profile picture for each user' do
        page.has_selector?('img')
      end

      scenario 'See the number of posts each user has written' do
        expect(page).to have_content('Number of posts:')
      end

      scenario "When I click on a user, I am redirected to that user's show page" do
        click_link 'John'
        expect(current_path).to eq user_path(User.first.id)
      end
    end
  end
end
