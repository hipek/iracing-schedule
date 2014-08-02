class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_team

  layout 'dark'

  protected

  def default_url_options(options=nil)
    params[:team_id].present? ? {:team_id => params[:team_id]} : {}
  end

  def current_team
    @current_team ||= Team.find_by(slug: params[:team_id])
  end

  def team_required
    if current_team.blank?
      redirect_to root_url, notice: t('Team is required')
    end
  end
end
