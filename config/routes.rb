Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   resources :users do
   	collection do
   		get :listbeds
         get 'previous', :to => 'users#previous'
         get 'checkout/:id', :to => 'users#checkout'
         get 'bill/:id', :to =>'users#bill'
   	end
   end	
   resources :admins do
      collection do
         get 'approvecheckin/:id/:qt', :to => 'admins#approvecheckin'
         get 'approvecheckout/:id/:qt', :to => 'admins#approvecheckout'
         get 'disapprovecheckout/:id', :to => 'admins#disapprovecheckout'
         get 'disapprovecheckin/:id', :to => 'admins#disapprovecheckin'
         get 'error', :to => 'admin#error'
      end
   end
   resources :mains
   resources :beds

   resources :requests do
   	collection do
   		get 'create/:val', to: 'resources#create'
   	end
   end

end


