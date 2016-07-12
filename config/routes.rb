Rails.application.routes.draw do
  
  get '/read', to: 'welcome#readExcel'
  root 'welcome#index'
  
end
