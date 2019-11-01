Rails.application.routes.draw do

  resources :leads
  resources :quotes

  devise_for :users
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get 'gmap' => 'pages#gmap'
  get 'texttospeech/create'
  get 'rails_admin/application/create'
  get 'quotes' => 'quotes#new'
  get 'residentialService' => 'pages#residentialService'
  get 'corporateService' => 'pages#corporateService'
  get '/pages' => 'pages#index'
  root 'pages#index'
post "/pages" => "pages#index"
end
