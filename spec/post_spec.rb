require 'rails_helper'

RSpec.describe Post, type: :model do
  # tests go here
  subject { Post.new(author: User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.'), title: 'Hello', text: 'This is for testing') }

  before { subject.save }

  it 'expects post title to be invalid' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'User post counter to increment' do
    subject.send(:update_posts_counter)
    expect(subject.author.posts_counter).to be(1)
  end

  it 'Likes Counter attribute should be greater or equal to zero' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end
end
