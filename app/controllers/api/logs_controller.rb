class Api::LogsController < ApiController

  def log
    if handler.log
      render json: handler.results
    else
      render json: {errors: handler.errors}
    end
  end

  private

  def handler
    @handler ||= Handler.new(params[:request_data])
  end
end
