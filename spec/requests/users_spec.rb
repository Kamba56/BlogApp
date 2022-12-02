require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Users', type: %w[request] do
  before :each do
    @user = User.new(
      name: 'Toma',
      photo: 'http://great.com/org.pjg',
      bio: 'Full-stack developer',
      posts_counter: 0
    )
    @user.save
  end

  describe 'GET /index' do
    it 'renders index template' do
      get '/users/'
      expect(response.status).to eq(200)
      expect(response).to render_template('index')
    end
  end

  describe 'GET /show' do
    it 'renders the show template' do
      get "/users/#{@user.id}"
      expect(response.status).to eq(200)
      expect(response).to render_template('show')
      expect(response.body).to include('Displays specific user')
    end
  end
end

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/users/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/users/show"
      expect(response).to have_http_status(:success)
    end
  end

end
