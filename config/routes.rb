Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # devise_for :users
  scope '/api' do
    resources :addons
  end
end


# TODO: OAuth from the client to get a token and use that token for when the client request for data
