class HomeController < ApplicationController
  def index
    @season = Season.active.latest
    show
  end

  def show
    @season ||= Season.past.where(id: params[:id]).first
    if @season
      @user_series = @season.user_series(current_team)
    end
    render 'index'
  end
end
