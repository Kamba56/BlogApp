require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Associations between the tables' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
end
