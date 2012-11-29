include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :album do
    name "album-name"
    genre "album-genre"
    cover { Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/images/test.png", 'image/png') }

  end
end
