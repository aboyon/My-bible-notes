RailsApp::Application.routes.draw do
  
  resources :notes

  devise_for :users

  # The priority is based upon order of creation:
  # first created -> highest priority.

  root :to => "home#index"

  match 'about' => "static#about"
  match 'statement' => "static#statement"
  match 'contact' => "static#contact"
  match 'team' => "static#team"
  match 'dashboard' => "users#dashboard"

end
