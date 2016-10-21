Rails.application.routes.draw do

  root 'photos#random'

  resources :photos, only: [:edit, :update] do
    get :random, on: :collection
  end

end
