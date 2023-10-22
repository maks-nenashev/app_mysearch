Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
get '/' =>'home#index'   # Eto nuzno wsegda! 
root to: "home#index"

resources :things do
     resources :comments #, except: %i[new show] # Wse marшруты нужны кроме [ new show]
   end #4 

resources :articles do
    resources :comments #, except: %i[new show] # Wse marшруты нужны кроме [ new show]
    #map.resources :articles , :has_many => :comments 
  end #4 
  #get 'contacts' => 'contacts#new' only:[:create]
  #resource :contacts, only: [:new,:create,:show], path_names: { :new => '' }
                                            #Etot code dla 'contacts' => 'contacts#new'
 #map.resources :articles , :has_many => :comments 
 #map.resources :things , :has_many => :comments 
                                            #map.resources :events , :has_many => :comments                                       # Chtoby "contacts#new" otkrywalsa w "contacts"

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# Defines the root path route ("/")
# root "articles#index
  # Defines the root path route ("/")
  # root "articles#index"
end
