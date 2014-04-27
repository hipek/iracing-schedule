class HomeController < ApplicationController
  def index
    @season = Season.active.latest
    if @season
      @user_series = @season.user_series(current_team)
    end
  end
end
