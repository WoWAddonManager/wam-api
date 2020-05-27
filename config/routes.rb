Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  scope '/api' do
    resources :addons
    get "users/:id", to: "users#show"
  end

end

