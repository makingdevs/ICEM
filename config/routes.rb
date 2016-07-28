Rails.application.routes.draw do

  get '/data', to: 'welcome#data_sample'
  get '/security', to: 'welcome#security'
  get '/example', to: 'welcome#example'
  get '/renderDataExampe', to: 'welcome#renderDataExampe'
  root 'welcome#index'

end
