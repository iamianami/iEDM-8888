Rails.application.routes.draw do
 

  mount Ckeditor::Engine => '/ckeditor'
   root 'main#index'
   resources :posts do
        member do
          post :collect
          post :like
        end
      resources :comments,only: [:create,:new,:destroy] do 
        member do
           post :like
        end
      end

   end
   resources :users,only: [:create,:edit,:update,:show]
   resources :categories,only: [:create,:new,:show]
   resources :top10,only: [:index]

   resources :video_posts do
      resources :video_comments,only: [:create,:destroy]
   end

   get '/login' ,to: 'sessions#new'
   post '/login' , to: 'sessions#create' 

   get '/logout' , to: 'sessions#destroy'
   get '/register' , to:'users#new'
end
