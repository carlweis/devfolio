Rails.application.routes.draw do
  root 'articles#index'
  
  # article routes
  resources :articles do
    resources :comments
  end

  # api routes
  namespace :api do
    resources :posts
    post 'markdown/convert/' => 'markdown#convert', as: :markdown_render
  end
end
