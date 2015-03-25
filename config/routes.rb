Rails.application.routes.draw do

    resources :authentications

  resources :recipes do
	  resources :comments
	end

  root to: 'visitors#index'


  get 'tags/:tag', to: 'recipes#index', as: :tag
   get '/auth/:provider/callback' => 'authentications#create'
   delete '/authentications"' => 'authentications#destroy'
   devise_for :users, :controllers => {:registrations => "registrations"}
   
  resources :users

   mount Ckeditor::Engine => '/ckeditor'
   
   get '/autocomplete' => 'visitors#autocomplete'

end
