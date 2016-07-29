Rails.application.routes.draw do

  get '/data', to: 'welcome#data_sample'
  root 'welcome#index'

end
