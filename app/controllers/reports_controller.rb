class ReportsController < ApplicationController

  def show
    @application    = Application.find(params[:application_id])
    @report_data    = @application.request_logs.map { |log| [log.time_in_ruby, log.time_in_db, log.time_rendering]}
    @time_in_ruby   = time_in_ruby
    @time_in_db     = time_in_db
    @time_rendering = time_rendering
  end

  private

  def time_in_ruby
    @application.request_logs.pluck(:time_in_ruby)
  end

  def time_in_db
    @application.request_logs.pluck(:time_in_db)
  end

  def time_rendering
    @application.request_logs.pluck(:time_rendering)
  end

  MathError = Class.new(StandardError)
end
