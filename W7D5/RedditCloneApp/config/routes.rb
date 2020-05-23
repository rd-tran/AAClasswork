Rails.application.routes.draw do
  root to: redirect('/subs')

  resources :users, only: %i[show new create edit update]
  resource :session, only: %i[new create destroy]
  
  resources :subs, except: :destroy do
    resources :posts, only: %i[index new]
  end

  resources :posts, except: %i[index new]

end
