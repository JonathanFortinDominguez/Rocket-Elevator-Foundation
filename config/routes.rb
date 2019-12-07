Rails.application.routes.draw do
  devise_for :users do
  end
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get 'gmap' => 'pages#gmap'
  get 'texttospeech/create'
  get 'rails_admin/application/create'
  get 'quotes' => 'quotes#new'
  get 'residentialService' => 'pages#residentialService'
  get 'corporateService' => 'pages#corporateService'
  root 'pages#index'

  get '/machine_learning', to: 'pages#machine_learning'
  get '/confirm_profile', to: 'pages#confirm_profile'
  get '/delete_profile', to: 'pages#delete_profile'
  get '/confirm_enroll', to: 'pages#confirm_enroll'
  get '/identified_profile', to: 'pages#identified_profile'
  
  post '/recognize' => 'machine_learning#createProfile'
  post '/delete', to: 'machine_learning#deleteProfile'
  post '/enroll', to: 'machine_learning#enroll'
  post '/transcribe', to: 'machine_learning#recognize'
  


  resources :pages
  resources :interventions
  resources :leads
  resources :quotes

end
