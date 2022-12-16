require 'rails_helper'

RSpec.describe 'post index/#html', type: :feature do
  before :each do
    @user1 = User.create(name: 'Peter', photo: 'https://www.google.com/images', bio: 'Software Engineer',
                       posts_counter: 2)
    @user1_post = Post.create(user: @user1, title: 'Senior Developer', article: 'I love learning', likes_counter: 2, comments_counter: 1)
    Comment.create(article: 'I love what you are becoming', user: @user1, post: @user1_post)
  end

  before(:example) { visit user_posts_path(@user1) }

  describe 'index page' do
    it 'I can see the users profile picture' do
      expect(page).to have_content(@post)
    end

    it 'i can see the users username' do
      expect(page).to have_content('Peter')
    end

    it 'I can see the number of posts the user has written' do
      expect(page).to have_content('Number of posts: 3')
    end

    it 'I can see a posts title.' do
      expect(page).to have_content('I love learning')
    end

    it 'I can see some of the posts body.' do
      expect(page).to have_content('I love learning')
    end

    it 'I can see the first comments on a post.' do
      expect(page).to have_content('I love what you are becoming')
    end

    it 'I can see how many comments a post has' do
      expect(page).to have_content('No of comments: 2')
    end

    it 'I can see how many likes a post has.' do
      expect(page).to have_content('No of likes: 2')
    end

    it 'I can see a section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_content('Pagination')
    end
  end

  context 'posts show/#html' do
    before :each do
      @user2 = User.create(name: 'Gasa', photo: 'https://www.google.com', bio: 'Software', posts_counter: 1)
      @user2_post = Post.create(user: @user2, title: 'Developer', article: 'I love learning', likes_counter: 8, comments_counter: 1)
      Comment.create(article: 'I love what you are becoming', user: @user2, post: @user2_post)
    end
    before(:example) { visit user_path(@user2) }
    it 'I can see the post title.' do
      expect(page).to have_content('Developer')
    end
    it 'I can see who wrote the post.' do
      expect(page).to have_content('Gasa')
    end
    it 'I can see how many comments it has' do
      expect(page).to have_content('No of comments: 2')
    end
    it 'I can see how many likes it has.' do
      expect(page).to have_content('No of likes: 8')
    end
    it 'I can see the post body' do
      expect(page).to have_content('I love learning')
    end

    it 'I can see the username of each commentor.' do
      expect(page).to have_content('Gasa')
    end
  end
end