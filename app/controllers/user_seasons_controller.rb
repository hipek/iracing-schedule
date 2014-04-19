class UserSeasonsController < ApplicationController
  def index
    @user_seasons = UserSeason.all
  end

  def new
    @user_season = UserSeason.new
  end

  def edit
    @user_season = UserSeason.new
  end

  def create
    p params
  end
end
