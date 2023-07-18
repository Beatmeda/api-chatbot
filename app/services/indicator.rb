class Indicator
  BASE_URL = 'https://mindicador.cl/api'

  def self.consult
    begin
      response = FaradayHttp.new(url: BASE_URL).client

      if response.success?
        indicators = JSON.parse(response.body)
        IndicatorMapper::renderer(IndicatorMapper::to_api(indicators))
      else
        IndicatorMapper::renderer(nil, "Error al consultar los indicadores económicos.", :bad_request, false)
      end
    rescue StandardError => e
      IndicatorMapper::renderer(nil, e.message, :bad_request, false)
    end
  end
end