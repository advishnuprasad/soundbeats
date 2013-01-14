class HomeController < ApplicationController
  skip_filter :authenticate_user!

  def index
    flash.now[:error] = "Announcements goes here"
    # redirect_to albums_path if current_user
  end
end
