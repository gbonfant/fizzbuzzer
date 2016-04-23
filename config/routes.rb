Rails.application.routes.draw do
  root 'homepage#index'

  resources :numbers, param: :value, only: [:index] do
    post :add_favourite
    delete :remove_favourite
  end
end
