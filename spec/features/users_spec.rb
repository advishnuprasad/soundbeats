
describe "SoundBeats users" do

  context "can sign up for a new account" do

    it "clicking on Sign Up link at the homepage" do
      visit root_path
      click_link 'Sign Up'

      fill_in 'Email', :with => 'newuser@example.com'
      
      find('#user_password').set('password123')
      find('#user_password_confirmation').set('password123')

      click_button 'Sign up'

      page.should have_content 'You have signed up successfully'
      current_path.should eq albums_path
    end
  end

  context "can sign in to their account" do
    let(:user) {FactoryGirl.create(:user)}

    it "clicking on Sign In link at the homepage" do
      sign_in(user,root_path)
      page.should have_content 'Signed in successfully'
      current_path.should eq albums_path
    end

  end

  context "can sign out of their account" do
    let(:user) {FactoryGirl.create(:user)}

    it "clicking on Sign Out link at the homepage given they are already signed in" do
      sign_in(user,root_path)
      page.should have_content 'Signed in successfully'

      click_link 'Sign Out'
      page.should have_content 'Signed out successfully'
    end
  end

  context "cannot sign out of their account" do
    it "if they are not signed in" do
      visit root_path
      page.should_not have_link 'Sign Out'
    end
  end
end