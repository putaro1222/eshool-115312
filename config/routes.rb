Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  get 'curriculums/index'
  root to: "curriculums#index"
  resources :curriculums do
    resources :studies, only: [:index, :create]
  end
end
