Rails.application.routes.draw do

  resources :data_indicators
  get '/read', to: 'welcome#readExcel'
  get '/data', to: 'welcome#data_sample'
  root 'welcome#index'

end
