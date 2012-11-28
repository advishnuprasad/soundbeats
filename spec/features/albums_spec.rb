
describe "Soundbeats registered users" do

  context "View their albums" do
    let(:user) {FactoryGirl.create(:user)}
    
    it "will redirect to the albums page on sign in" do
      sign_in(user,root_path)
      current_path.should eq albums_path
    end

  end



end