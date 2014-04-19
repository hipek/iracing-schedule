class SrsTrackValuesController < ApplicationController
  def update
    @value = SrsTrackValue.find_or_initialize_by(
      series_track_id: params[:id],
      user_id:         params[:user_id]
    )
    @value.update_attributes value: params[:value]
    render nothing: true
  end
end
