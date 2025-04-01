class HomeController < ApplicationController
  def index
    @app_name = ENV["APP_NAME"]
  end
end
