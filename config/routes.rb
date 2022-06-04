Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "static#dashboard"
  get 'people/:id', to: 'static#person'
  get 'my_expenses', to: 'users#my_expenses'
  post 'add_expense', to: 'static#add_expense'
end
