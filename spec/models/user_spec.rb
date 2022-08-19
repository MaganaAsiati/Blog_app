require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes ' do
    expect(User.create(Name: 'Tom', Photo: 'https://unsplash.com/Photos/F_-0BxGuVvo',
                       Bio: 'Teacher from Mexico.', Posts_Counter: 0)).to be_valid
  end

  it 'is not valid with Name empty ' do
    expect(User.create(Name: '', Photo: 'https://unsplash.com/Photos/F_-0BxGuVvo',
                       Bio: 'Teacher from Mexico.')).to_not be_valid
  end

  it 'is not valid with Posts_Counter nil' do
    expect(User.create(Name: 'Tom', Photo: 'https://unsplash.com/Photos/F_-0BxGuVvo',
                       Bio: 'Teacher from Mexico.', Posts_Counter: nil)).to_not be_valid
  end

  it 'is not valid with Posts_Counter of type string' do
    expect(User.create(Name: 'Tom', Photo: 'https://unsplash.com/Photos/F_-0BxGuVvo',
                       Bio: 'Teacher from Mexico.', Posts_Counter: 'nil')).to_not be_valid
  end

  it 'should return 3 posts' do
    author = User.create(Name: 'Tom', Photo: 'https://unsplash.com/Photos/F_-0BxGuVvo',
                         Bio: 'Teacher from Mexico.', Posts_Counter: 0)
    Post.create(author:, Title: 'Hello', Text: 'This is my first post', Comments_Counter: 0, Likes_Counter: 0)
    Post.create(author:, Title: 'Hello', Text: 'This is my first post', Comments_Counter: 0, Likes_Counter: 0)
    Post.create(author:, Title: 'Hello', Text: 'This is my first post', Comments_Counter: 0, Likes_Counter: 0)
    Post.create(author:, Title: 'Hello', Text: 'This is my first post', Comments_Counter: 0, Likes_Counter: 0)

    expect(author.recent_posts.count).to eq(3)
  end
end
