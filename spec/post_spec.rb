require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @post = Post.create(
      user: @user,
      title: 'Hello',
      article: 'This is my first post',
      comments_counter: 0,
      likes_counter: 0
    )
  end

  context 'invalid inputs' do
    it 'is inavlid when Title is blank' do
      @post.title = ''
      expect(@post).to_not be_valid
    end

    it 'is invalid when :title length > 250' do
      @post.title = 'g' * 251
      expect(@post).to_not be_valid
    end

    it 'comment counter should be greater than or equal to zero' do
      @post.comments_counter = 0
      expect(@post).to_not be_valid
    end

    it 'like counter should be greater than or equal to zero' do
      @post.likes_counter = 0
      expect(@post).to_not be_valid
    end
  end

  context 'Associations' do
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should belong_to(:user) }
  end
end
