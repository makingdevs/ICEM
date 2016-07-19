Rails.application.routes.draw do

  resources :data_indicators
  get '/read', to: 'welcome#readExcel'
  get '/data', to: 'welcome#data_sample'
  get '/security', to: 'welcome#security'
  root 'welcome#index'

end
