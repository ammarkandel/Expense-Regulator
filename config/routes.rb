Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  devise_scope :user do
    authenticated do
      root 'profiles#home', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  resources :expenses
  get '/ungrouped', to: 'expenses#ungrouped'
  resources :groups

  get '/members', to: 'profiles#members'
end
