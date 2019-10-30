Rails.application.routes.draw do

  resources :leads
  resources :quotes

  devise_for :users
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'gmap' => 'pages#gmap'
  get 'texttospeech/create'
  get 'leads' => 'leads#new'
  get 'quotes' => 'quotes#new'
  get 'residentialService' => 'pages#residentialService'
  get 'corporateService' => 'pages#corporateService'
  
  root 'pages#index'

end
