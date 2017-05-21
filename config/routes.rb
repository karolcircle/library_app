Rails.application.routes.draw do  

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
 
  root to: 'books#index'

  resources :lendings do
    put :return_book, on: :member    
  end

  resources :books do
    get :copies, on: :member
    get :my_books, on: :member   
  end
end
