Rails.application.routes.draw do

 resources :companies do
   resources :messages
 end
 root "companies#index"
end
