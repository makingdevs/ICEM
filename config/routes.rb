Rails.application.routes.draw do

  get '/data', to: 'welcome#data_sample'
  get '/states', to: 'states#states'
  root 'welcome#index'

end
