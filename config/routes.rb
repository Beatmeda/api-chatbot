Rails.application.routes.draw do
  get 'api/initial_list', to: 'chat_bot#initial_list'
  get 'api/indicators', to: 'indicators#get_indicators'
  post 'api/consult_deposit', to: 'deposits#search'
  post 'api/request_paper_rolls', to: 'deposits#paper_rolls'
  get 'api/validate_rut', to: 'chat_bot#validate_rut'
end
