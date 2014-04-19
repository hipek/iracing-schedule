class HomeController < ApplicationController
  def index
    @season = Season.latest
    @user_series = @season.user_series
    @users = @season.user_seasons.includes(:user).map(&:user).flatten.uniq
  end
end
