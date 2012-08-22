Uxme::Application.routes.draw do

  root to: 'pages#home'
  # match '/ui(/:action)', controller: 'ui'
  match '/thanks', to: "pages#thanks", as: :thanks

  resources :quotes
  resources :pages

end
