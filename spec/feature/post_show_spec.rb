require 'rails_helper'
RSpec.describe 'Post', type: :feature do
  describe 'Post' do
    before(:each) do
      @user = User.create(Name: 'Nemwel', Photo: 'nemwel.jpg', Bio: 'Taekwondo master.')
      @post = Post.create(author: @user, Title: 'Tests', Text: 'testing', Likes_Counter: 7,
                          Comments_Counter: 5)
      @post.save
      @comment1 = Comment.create(text: 'My first comment', author: @user, post: @post)
      @comment2 = Comment.create(text: 'My second comment', author: @user, post: @post)
    end

    feature 'Post show' do
      background { visit user_post_path(@user.id, @post.id) }
      it 'I can see the post\'s title.' do
        expect(page).to have_content 'testing'
      end

      it 'Can see who wrote the post' do
        expect(page).to have_content 'Nemwel'
      end
      it 'Can see how many comments it has' do
        expect(page).to have_content 'Comments 7 '
      end
      it 'Can see how many likes it has' do
        expect(page).to have_content 'Likes 7'
      end
      it 'Can see the post body' do
        expect(page).to have_content 'testing'
      end
      it 'Can see the username of each commentor' do
        expect(page).to have_content 'Nemwel'
      end
      it 'Can see the comment each commentor left' do
        expect(page).to have_content 'My first comment'
        expect(page).to have_content 'My second comment'
      end
    end
  end
end
