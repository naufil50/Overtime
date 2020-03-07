require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end
  describe 'index' do
    before do
      visit posts_path
    end
  	it 'can be reached successfully' do      
      expect(page.status_code).to eq(200)
    end 

    it 'has title as Posts' do
      expect(page).to have_content(/Posts/)
    end 

    it 'has list of Posts' do
      post1 = FactoryGirl.build_stubbed(:post)
      post2 = FactoryGirl.build_stubbed(:second_post)
      visit posts_path
      expect(page).to have_content(/Rationale|content/)
    end
  end	

  describe 'creation' do
    before do      
      visit new_post_path
    end

    it 'has a new form' do     
      expect(page.status_code).to eq(200) 
    end  

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Anything is present"
      click_on 'Save'

      expect(page).to have_content("Anything is present") 
    end

    it 'will have user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User_Association"
      click_on 'Save'

      expect(User.last.posts.last.rationale).to eq("User_Association")
    end
  end
    
    describe 'new' do
      it 'has a link from the homepage' do
        visit root_path

        click_link("new_post_from_nav")
        expect(page.status_code).to eq(200)
      end
    end

  describe 'delete' do
    it 'can be deleted' do
      @post = FactoryGirl.create(:post)
      visit posts_path

      click_link("delete_post_#{@post.id}_from_index")
      expect(page.status_code).to eq(200)
    end
  end
    describe 'edit' do
    before do
      @post = FactoryGirl.create(:post)
    end

    it 'can be reached by clicking edit on index page' do
      visit posts_path

      click_link("edit_#{@post.id}")
      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_post_path(@post)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Edited content"
      click_on "Save"

      expect(page).to have_content("Edited content")
    end
  end
end