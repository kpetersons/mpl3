Mpl2::Application.routes.draw do

  root :to => "welcome#home"
  resource  :session,
            :controller => 'sessions',
            :only => [:new, :create, :destroy]
  match 'sign_out' => 'sessions#destroy', :via => :delete, :as => 'sign_out'

  match 'users/:id' => 'users#show', :as => :show_user

  resources :users, :only => [:show, :index]
  resources :users
  resources :accounts
  resources :categories
  resources :transactions
  resources :aims
  resources :plans
  resources :plan_items
end
