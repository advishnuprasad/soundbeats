module UserMacros
  def sign_in(user, path)
    visit path
    click_link 'Sign In'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button 'Login'
  end
end