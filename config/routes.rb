Rails3MongoidDevise::Application.routes.draw do
  resources :products
  root to: 'products#index'
end
