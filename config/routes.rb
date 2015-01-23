Rails.application.routes.draw do
  resources :tqa_categories

  resources :tqa_aspects

  get     "epics" => "epics#index"


  root to: 'visitors#index'
  devise_for :users
  resources :users
end
