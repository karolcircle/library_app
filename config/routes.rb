Rails.application.routes.draw do
  root to: 'books#index'

  resources :lendings do
    put :return_book, on: :member    
  end

  resources :books do
    get :copies, on: :member  
  end
end
