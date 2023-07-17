class DepositsController < ApplicationController
  def search
    @customer = find_customer_by_rut
    return rut_not_found unless @customer.present?

    deposit = find_deposit_by_date(deposits_params[:date])
    return deposit_not_found(deposits_params[:date]) unless deposit.present?

    render json: {
      balance: deposit.balance
    }
  end

  def paper_rolls
    @customer = find_customer_by_rut
    return rut_not_found unless @customer.present?

    date_tomorrow = Date.tomorrow
    @deposit = find_deposit_by_date(date_tomorrow)
    return deposit_not_found(date_tomorrow) unless @deposit.present?

    return invalid_quantity_rolls unless validate_quantity_rolls?

    return insufficient_balance unless is_insufficient_balance?

    if @deposit.update(balance: @deposit.balance - (700*deposits_params[:quantity_rolls].to_i))
      render json: { message: "Depósito actualizado correctamente", balance:  @deposit.balance}, status: :ok
    else
      render json: { error: "Error al actualizar el depósito." }, status: :unprocessable_entity
    end
  end

  private

  def find_customer_by_rut
    Customer.find_by(rut: deposits_params[:rut])
  end

  def find_deposit_by_date(date)
    @customer.deposits.find_by(date: date)
  end

  def rut_not_found
    render json: { error: "Rut de cliente no existe." }, status: :not_found
  end

  def deposit_not_found(date)
    render json: { error: "No se encontró un depósito para la fecha: #{date}." }, status: :not_found
  end

  def invalid_quantity_rolls
    render json: { error: "La cantidad de rollos debe ser un número entero." }, status: :bad_request
  end

  def insufficient_balance
    render json: { error: "Saldo insuficiente para realizar la solicitud de rollos." }, status: :unprocessable_entity
  end

  def validate_quantity_rolls?
    deposits_params[:quantity_rolls].to_i.to_s == deposits_params[:quantity_rolls]
  end

  def is_insufficient_balance?
    @deposit.balance >= (700*deposits_params[:quantity_rolls].to_i)
  end

  def deposits_params
    params.require(:deposits).permit(:rut, :date, :dispatch_address, :quantity_rolls)
  end
end