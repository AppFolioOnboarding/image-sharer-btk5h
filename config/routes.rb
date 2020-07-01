Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#home'

  resources :images

  get 'tag/:tag_name', to: 'tag#by_name', as: 'tag_by_name'
end
