class HomeController < ApplicationController
  def index
    @season = Season.latest
    if @season
      @user_series = @season.user_series
    end
  end
end
