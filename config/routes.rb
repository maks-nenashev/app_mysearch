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

  get 'articles/:id', to: 'articles#show', constraints: { id: /\d+/ }
  get 'articles/:local', to: 'articles#local'  



end
