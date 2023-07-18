class ApplicationController < ActionController::Base

  private
  def rut_not_found
    render json: { error: "Rut de cliente no existe." }, status: :not_found
  end

  def deposit_not_found(date)
    render json: { error: "No se encontró un depósito para la fecha: #{date}." }, status: :not_found
  end

  def invalid_quantity_rolls
    render json: { error: "La cantidad de rollos debe ser un número entero mayor a cero" }, status: :bad_request
  end

  def insufficient_balance
    render json: { error: "Saldo insuficiente para realizar la solicitud de rollos." }, status: :unprocessable_entity
  end
end
