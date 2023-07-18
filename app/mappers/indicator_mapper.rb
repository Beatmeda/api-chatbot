class IndicatorMapper
  def self.to_api(response)
    return {
      value_uf: response['uf']['valor'],
      value_usd: response['dolar']['valor'],
      value_exchange_usd: response['dolar_intercambio']['valor'],
      value_eur: response['euro']['valor'],
      value_ipc: response['ipc']['valor'],
      value_utm: response['utm']['valor'],
    }
  end

  def self.renderer(result, message = '', status = :ok, is_successful = true)
    return {
      result: result,
      is_successful: is_successful,
      error: message,
      status: status
    }
  end
end