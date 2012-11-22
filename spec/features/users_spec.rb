
describe "account management" do

  context "user can sign up and sign in" do
    let(:user) {FactoryGirl.create(:user)}

    it "allows a user to sign up" do
      visit root_path
      click_link 'Sign Up'
      fill_in 'Email', :with => 'newuser@examplec.om'
      fill_in 'Password', :with => 'password123'
      fill_in 'Password Confirmation', :with => 'password123'
      click_button 'Sign Up'

      page.should have_content 'Signed up successfully'
    end

    it "allows a user to sign in" do
      visit root_path
      click_link 'Sign Up'
      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => user.password
      click_button 'Login'

      page.should have_content 'Signed in successfully'
    end

  end
end