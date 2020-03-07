require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'creation' do
  	 before do
       @user = FactoryGirl.create(:user)
       login_as(@user, :scope => :user)
  	   @post = FactoryGirl.create(:post)
  	 end

  	 it 'can be created' do
  	   expect(@post).to be_valid
  	 end

  	 it 'can be created' do
  	   expect(@post).to be_valid
  	 end

  	 it 'cannot be created' do
  	 	@post.date = nil
  	 	@post.rationale = nil
  	   expect(@post).to_not be_valid
  	 end
  end
end
