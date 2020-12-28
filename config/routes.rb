Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   resources :users do
   	collection do
   		get :listbeds
   	end
   end	
   resources :admins
   resources :mains
   resources :beds

   resources :requests do
   	collection do
   		get 'create/:val', to: 'resources#create'
   	end
   end

end
