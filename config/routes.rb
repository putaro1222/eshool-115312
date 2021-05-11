Rails.application.routes.draw do
  devise_for :users
  root to: "curriculums#index"
end
