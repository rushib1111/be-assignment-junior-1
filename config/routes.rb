Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "expenses#dashboard"

  resources :expenses do
    collection do
      get :dashboard
      get :my_expenses
      post :add_expense
      post :settle_expense
    end
  end

  resources :users do
    member do
      get :friend_expenses
    end
  end
end
