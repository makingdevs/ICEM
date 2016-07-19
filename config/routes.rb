Rails.application.routes.draw do

  get '/data', to: 'welcome#data_sample'
  get '/security', to: 'welcome#security'
  root 'welcome#index'

end
