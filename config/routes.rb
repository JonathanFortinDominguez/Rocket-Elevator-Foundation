Rails.application.routes.draw do

  resources :interventions
  resources :leads
  resources :quotes

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/sign_up' => 'devise/sessions#new'
  end
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get 'gmap' => 'pages#gmap'
  get 'texttospeech/create'
  get 'rails_admin/application/create'
  get 'quotes' => 'quotes#new'
  get 'residentialService' => 'pages#residentialService'
  get 'corporateService' => 'pages#corporateService'
  root 'pages#index'

  resources :pages
  resources :quotes

end
