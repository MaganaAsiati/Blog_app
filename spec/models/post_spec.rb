require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.create(author_id: 1, Title: 'Hello', Text: 'This my first post') }
  before { subject.save }

  it 'title should be not blank' do
    subject.Title = nil
    expect(subject).to_not be_valid
  end

  it 'title should be not blank' do
    subject.Title = 't' * 251
    expect(subject).to_not be_valid
  end
  it 'CommentsCounter must be an integer ' do
    subject.Comments_Counter = 'text'
    expect(subject).to_not be_valid
  end
  it 'CommentsCounter must be greater than or equal to zero ' do
    subject.Comments_Counter = -1
    expect(subject).to_not be_valid
  end

  it 'LikesCounter must be an integer greater than or equal to zero. ' do
    subject.Likes_Counter = 'word'
    expect(subject).to_not be_valid
  end
  it 'LikesCounter must be an integer greater than or equal to zero. ' do
    subject.Likes_Counter = -1
    expect(subject).to_not be_valid
  end
end
