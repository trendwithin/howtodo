Rails.application.routes.draw do
  resources :themes do
    resources :steps
  end

  root 'themes#index'
end
