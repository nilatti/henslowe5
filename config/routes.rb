Rails.application.routes.draw do
  get '/auth/github', to: 'authentication#github', format: false
  resources :productions
  resources :theaters
  resources :plays
  resources :playwrights do
    get :plays, on: :member
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
