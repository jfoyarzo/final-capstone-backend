Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  resources :investigators, only: %i[index show create destroy]
  resources :appointments, only: %i[index show create destroy]
end
