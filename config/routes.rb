Rails.application.routes.draw do

  get '/data', to: 'welcome#data_sample'
  get '/states', to: 'states#states'
  get '/about', to: 'about#index'
  root 'welcome#index'

end
