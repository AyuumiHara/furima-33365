Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items
  delete 'items/:id' => 'items#destroy'

end
