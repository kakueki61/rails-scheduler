Rails.application.routes.draw do
  devise_for :staffs
  devise_for :workers
  devise_for :users

  get 'welcome/index'
  root 'welcome#index'

  resources :schedules
  resources :workers

  resource :staff do
    resource :shop, only: [:show]
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
