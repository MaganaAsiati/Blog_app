require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Mexico.') }
  before { subject.save }

  it 'Name should not be blank' do
    subject.Name = nil
    expect(subject).to_not be_valid
  end
  it 'PostsCounter must be an integer ' do
    subject.Posts_Counter = -1
    expect(subject).to_not be_valid
  end
  it 'PostsCounter must be greater than or equal to zero. ' do
    subject.Posts_Counter = 'word'
    expect(subject).to_not be_valid
  end
end
