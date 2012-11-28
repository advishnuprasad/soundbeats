class HomeController < ApplicationController
  skip_filter :authenticate_user!

  def index
    redirect_to albums_path if current_user
  end
end
