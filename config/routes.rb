Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/apartments', to: 'apartments#index'
  get '/apartments/:id', to: 'apartments#show' 
end
