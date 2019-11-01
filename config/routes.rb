Rails.application.routes.draw do

  resources :leads
  resources :quotes

  devise_for :users
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get 'gmap' => 'pages#gmap'
  get 'texttospeech/create'
  get 'rails_admin/application/create'
  get 'leads' => 'leads#new'
  get 'quotes' => 'quotes#new'
  get 'residentialService' => 'pages#residentialService'
  get 'corporateService' => 'pages#corporateService'
  get '/index' => 'pages#index'
  root 'pages#index'
post "/index" => "pages#index"
end
