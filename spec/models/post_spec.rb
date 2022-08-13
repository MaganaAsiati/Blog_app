require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @author = User.create(Name: 'Tom', Photo:'https://unsplash.com/photos/F_-0BxGuVvo',
                          Bio: 'Teacher from Mexico.', Posts_Counter: 0 )
  end

    it 'is valid with valid attributes' do
      expect(Post.create(author:@author, Title: 'Hello', Text: 'This is my first post', Comments_Counter: 0, Likes_Counter: 0)).to be_valid
    end
  
 

  it 'is not valid with title empty' do
    expect(Post.create(author:@author, Title: '', Text: 'This is my first post', Comments_Counter: 0, Likes_Counter: 0)).to_not be_valid
  end

  it 'is not valid with title exceeding 250 characters ' do
    Title = 'r' * 251
    expect(Post.create(author:@author, Title:, Text: 'This is my first post', Comments_Counter: 0, Likes_Counter: 0)).to_not be_valid
  end

  it 'should update post counter' do
    Post.create(author:@author, Title: 'Hello', Text: 'This is my first post', Comments_Counter: 0, Likes_Counter: 0)
    expect(@author.Posts_Counter).to eq(1)
  end

  it 'should return five (5) most recent comments' do
    post = Post.create(author:@author, Title: 'Hello', Text: 'This is my first post', Comments_Counter: 6, Likes_Counter: 0)
    Comment.create(post:, author: @author, text: 'Hi Tom!')
    Comment.create(post:, author: @author, text: 'Hi Tom!')
    Comment.create(post:, author: @author, text: 'Hi Tom!')
    Comment.create(post:, author: @author, text: 'Hi Tom!')
    Comment.create(post:, author: @author, text: 'Hi Tom!')
    Comment.create(post:, author: @author, text: 'Hi Tom!')

    expect(post.recent_comments.count).to eq(5)
  end
end
