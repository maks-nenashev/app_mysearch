Rails.application.routes.draw do
  
get '/' =>'home#index'   # Eto nuzno wsegda! 
root to: "home#index"

resources :senses do
  resources :comments 
end 

resources :things do
     resources :comments 
   end 

resources :articles do
    resources :comments 
  end  
  
end
