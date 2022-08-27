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
    feature 'User show page' do
      background { visit user_path(@first_user.id) }

      scenario 'See profile picture for each user' do
        page.has_selector?('img')
      end

      scenario 'I can see the user\'s username' do
        expect(page).to have_content('John')
      end

      scenario 'I can see the user\'s bio' do
        expect(page).to have_content('Developer.')
      end

      scenario 'I can see the user\'s first 3 posts' do
        expect(page).to have_content('post title')
      end

      scenario 'I can see a button that lets me view all of a user\'s posts' do
        expect(page).to have_content('see all posts')
      end

      scenario 'I can see the number of posts the user has written' do
        visit '/'
        expect(page).to have_content("Number of posts: #{@first_user.Posts_Counter}")
      end

      scenario 'When I click a user\'s post, it redirects me to that post\'s show page.' do
        click_link 'post title'
        expect(current_path).to eq user_post_path(@first_user.id, Post.first.id)
      end

      scenario 'redirects to the user\'s post\'s index page when you click on a see all posts' do
        click_link 'see all posts'
        expect(current_path).to eq user_posts_path(@first_user.id)
      end
    end
  end
end
