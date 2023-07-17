class ChatBotController < ApplicationController
  def initial_list
    render json: {
      data: [
        {
          id: '1',
          options: [
            {
              value: 'deposit_inquiry',
              label: 'Consulta de Depósito',
              trigger: 'CD'
            },
            {
              value: 'request_paper_rolls',
              label: 'Realizar Solicitud Rollos de Papel ',
              trigger: 'RP'
            },
            {
              value: 'economic_indicators',
              label: 'Consulta Indicadores Económicos',
              trigger: 'IE'
            }
          ]
        },
        {
          id: 'CD',
          message: 'Por favor ingrese el Rut',
          trigger: '2'
        },
        {
          id: 'RP',
          message: 'Otro mensaje para rollos',
          end: true
        },
        {
          id: 'IE',
          message: 'Otro mensaje para indicadores',
          end: true
        },
        {
          id: '2',
          user: true,
          trigger: '3'
        },
        {
          id: '3',
          message: 'Por favor ingrese la Fecha',
          end: true
        },
        {
          id: '4',
          message: 'Respuesta incorrecta, intente de nuevo.',
          trigger: '1',
        },
      ]
    }
  end

  def validate_rut

  end
end