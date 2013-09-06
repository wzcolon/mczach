class Api::LogsController < ApiController

  def log
    if handler.check_for_errors && handler.log
      render json: handler.results
    else
      render json: {errors: handler.errors}, status: 400
    end
  end

  private

  def handler
    @handler ||= Handler.new(params[:request_data])
  end
end
