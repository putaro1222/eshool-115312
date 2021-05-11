Rails.application.routes.draw do
  devise_for :users
  get 'curriculums/index'
  root to: "curriculums#index"
  resources :curriculums
end
