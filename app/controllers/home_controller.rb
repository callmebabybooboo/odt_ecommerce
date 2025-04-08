class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @app_name = ENV["APP_NAME"]
  end
end
