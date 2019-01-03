Rails.application.routes.draw do
  devise_for :staffs
  devise_for :workers
  devise_for :users

  get 'welcome/index'
  root 'welcome#index'

  # worker
  resource :worker do
    resources :schedules
  end

  # staff
  namespace :mng do
    resources :workers, only: [:index, :show] do
      resources :schedules, only: [:index], controller: :workers do
        get :arrange
        post :determine
      end
    end

    resource :staff do
      resource :shop, only: [:show]
    end
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
