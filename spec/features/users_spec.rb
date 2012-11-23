
describe "SoundBeats users" do

  context "can sign up for a new account" do

    it "clicking on Sign Up link at the homepage" do
      visit root_path
      click_link 'Sign Up'
      fill_in 'Email', :with => 'newuser@examplec.om'
      fill_in 'Password', :with => 'password123'
      fill_in 'Password Confirmation', :with => 'password123'
      click_button 'Sign Up'

      page.should have_content 'Signed up successfully'
    end
  end

  context "can sign in to their account" do
    let(:user) {FactoryGirl.create(:user)}

    it "clicking on Sign In link at the homepage" do
      visit root_path
      click_link 'Sign In'
      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => user.password
      click_button 'Login'

      page.should have_content 'Signed in successfully'
    end

  end

  context "can sign out of their account" do
    let(:user) {FactoryGirl.create(:user)}

    it "clicking on Sign Out link at the homepage given they are already signed in" do
      visit root_path
      click_link 'Sign In'
      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => user.password
      click_button 'Login'
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