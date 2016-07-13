Rails.application.routes.draw do
  
  resources :data_indicators
  get '/read', to: 'welcome#readExcel'
  root 'welcome#index'
  
end
