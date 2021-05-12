Rails.application.routes.draw do
  devise_for :users
  get 'curriculums/index'
  root to: "curriculums#index"
  resources :curriculums do
    resources :studies, only: [:index, :create]
  end
end
