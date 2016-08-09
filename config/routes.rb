Rails.application.routes.draw do

  get '/data', to: 'welcome#data_sample'
  get '/states', to: 'states#states'
  get '/about', to: 'about#index'
  get '/indicators', to: 'indicators#indicators'
  get '/indicators/data', to: 'indicators#data'
  root 'welcome#index'

end
