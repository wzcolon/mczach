class ApiController < ApplicationController

  before_filter :verify_api_key

  private

  def verify_api_key
    return unless Rails.env.production?
    return if params[:api_key] == api_key
    render json: {error: 'Invalid API Key'}, status: 403
  end

  def api_key
    "644721eedb95f223d45b4461a03ea1995e1ffe159d1a1dd3bcfbc89ed0222926"
  end
end
