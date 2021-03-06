  Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # list all cocktails


  resources :cocktails, only: [:index, :show, :new, :create, :destroy] do
      resources :doses, only: [:create]
    end

  resources :doses, only: :destroy

  root to: redirect('/cocktails')
end
