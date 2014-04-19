class HomeController < ApplicationController
  def index
    @season = Season.active.latest
    if @season
      @user_series = @season.user_series
    end
  end
end
