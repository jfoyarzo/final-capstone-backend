Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  namespace :v1 do
    resources :investigators, only: %i[index show create destroy]
    resources :appointments, only: %i[index show create destroy]
  end
end
