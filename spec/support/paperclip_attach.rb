require 'action_dispatch/testing/test_process'
require 'factory_girl'

FactoryGirl.class_eval do
  def attachment(name, path, content_type = nil)
    path_with_rails_root = Rails.root.join(path)
    uploaded_file = if content_type
                      Rack::Test::UploadedFile.new(path_with_rails_root, content_type)
                    else
                      Rack::Test::UploadedFile.new(path_with_rails_root)
                    end

    add_attribute name, uploaded_file
  end
end