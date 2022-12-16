# require 'rails_helper'
# require 'spec_helper'

# RSpec.describe 'Posts', type: %w[request] do
#   before :each do
#     @post = Post.new(
#       title: 'Great Efforts yield Great Results',
#       article: 'Its always hard at first put with time you again',
#       comments_counter: 0,
#       likes_counter: 0
#     )
#     @post.save
#   end

#   describe 'GET /index' do
#     it 'renders the index template' do
#       get '/users/:id/posts/'
#       expect(response.status).to eq(200)
#       expect(response.body).to include('List all users posts')
#     end
#   end

#   describe 'GET /show' do
#     it 'renders the show template' do
#       get "/users/posts/#{@post.id}"
#       expect(response.status).to eq(200)
#       expect(response).to render_template('show')
#     end
#   end
# end
