Rails.application.routes.draw do
  resources :avatars
  devise_for :customers
  resources :customers, only: [:index, :show, :update] do
    get 'profile/edit' => 'profiles#edit', as: :edit_profile
    patch 'profile' => 'profiles#update', as: :profile
    get 'profile/new' => 'profiles#new', as: :new_profile
    post 'profile' => 'profiles#create', as: :profiles
    # resource :profile, shallow: true, only: [:new, :create, :edit, :update]
  end

  root 'customers#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
