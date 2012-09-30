RailsApp::Application.routes.draw do
  
  resources :notes

  devise_for :users

  match 'about' => "static#about"
  match 'statement' => "static#statement"
  match 'contact' => "static#contact"
  match 'team' => "static#team"
  match 'dashboard' => "users#dashboard"
  match 'verse/search' => "verse#search"

  root :to => "home#index"

end