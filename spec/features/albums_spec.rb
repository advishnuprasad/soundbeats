
describe "Soundbeats registered users" do
  before :each do
    user = FactoryGirl.create(:user)
    sign_in(user,root_path)
  end

  context "can view the albums in their collection" do
    it "will show a list of albums of the user" do
      visit albums_path
      page.should have_content 'Your Album Collection'
    end

    it "will show the details of the album" do
      album = FactoryGirl.create(:album, :name => 'Ray of Light', :genre => 'Pop')
      visit albums_path
      click_link 'Ray of Light'
      within('h1') do
        page.should have_content 'Ray of Light'
      end
      page.should have_content 'Pop'
    end
  end

  context "can create albums and add to their collection" do
    it "will create a new album" do
      visit albums_path
      expect{
        click_link 'Add Album'
        fill_in 'Name', with: 'Celebration'
        fill_in 'Genre', with: 'Pop Culture'
        click_button 'Add Album To Collection'
      }.to change(Album, :count).by(1)

      page.should have_content 'New album added to your collection'
      within 'h1' do
        page.should have_content 'Celebration'
      end
    end

    it "will create a new album with a cover image" do
      visit albums_path
      expect{
        click_link 'Add Album'
        fill_in 'Name', with: 'Celebration'
        fill_in 'Genre', with: 'Pop Culture'
        attach_file('Cover', "#{Rails.root}/spec/fixtures/images/test.png")
        click_button 'Add Album To Collection'
      }.to change(Album, :count).by(1)

      page.should have_content 'New album added to your collection'
      within 'h1' do
        page.should have_content 'Celebration'
      end
    end

    it "will create a new album with different cover image sizes" do
      visit albums_path
      expect{
        click_link 'Add Album'
        fill_in 'Name', with: 'Celebration'
        fill_in 'Genre', with: 'Pop Culture'
        attach_file('Cover', "#{Rails.root}/spec/fixtures/images/test.png")
        click_button 'Add Album To Collection'
      }.to change(Album, :count).by(1)
      page.should have_content 'New album added to your collection'
      within 'h1' do
        page.should have_content 'Celebration'
      end

      within '#album_cover_image' do
        find('.small_cover').click
        page.status_code.should be(200)

        find('.medium_cover').click
        page.status_code.should be(200)

        find('.large_cover').click
        page.status_code.should be(200)
      end
      
    end

  end

  context "can edit existing albums in their collection" do
    it "will edit an album" do
      album = FactoryGirl.create(:album, :name => 'Ray of Light', :genre => 'Pop')
      visit albums_path
      click_link 'Ray of Light'
      click_link 'Edit Album'
      fill_in 'Name', with: 'Ray of Light ( Series 1 )'
      fill_in 'Genre', with: 'Pop Culture'
      click_button 'Save'
      within 'h1' do
        page.should have_content 'Ray of Light ( Series 1 )'
      end
      page.should have_content 'Pop Culture'
    end
  end


  context "can delete existing albums in their collection" do
    it "will delete an album" do
      album = FactoryGirl.create(:album, :name => 'Ray of Light', :genre => 'Pop')
      visit albums_path
      click_link 'Ray of Light'
      click_link 'Delete Album'
      current_path.should eq albums_path
      within 'h1' do
        page.should have_content 'Your Album Collection'
      end
      page.should_not have_content 'Ray of Light'
    end
  end

end