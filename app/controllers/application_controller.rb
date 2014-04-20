class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_team

  protected

  def default_url_options(options=nil)
    current_team.present? ? {:team => current_team.slug} : {}
  end

  def current_team
    @current_team ||= Team.find_by(slug: params[:team])
  end
end
