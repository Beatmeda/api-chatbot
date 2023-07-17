class IndicatorsController < ApplicationController
  require 'faraday'

  BASE_URL = 'https://mindicador.cl/api'

  def get_indicators
    begin
      response = Faraday.get(BASE_URL)

      if response.success?
        indicators = JSON.parse(response.body)
        render json: {
          value_uf: indicators['uf']['valor'],
          value_usd: indicators['dolar']['valor'],
          value_exchange_usd: indicators['dolar_intercambio']['valor'],
          value_eur: indicators['euro']['valor'],
          value_ipc: indicators['ipc']['valor'],
          value_utm: indicators['utm']['valor'],
        }
      else
        render json: { error: "Error al consultar los indicadores económicos." }, status: :bad_request
      end
    rescue Faraday::Error => e
      puts "Error de conexión: #{e.message}"
      render json: { error: "#{e.message}" }, status: :bad_request
    rescue JSON::ParserError => e
      puts "Error al capturar la respuesta JSON: #{e.message}"
      render json: { error: "#{e.message}" }, status: :bad_request
    end
  end
end