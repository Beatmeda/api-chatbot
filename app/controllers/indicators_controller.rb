class IndicatorsController < ApplicationController
  require 'faraday'

  def get_indicators
    result = Indicator::consult
    render json: result
  end
end