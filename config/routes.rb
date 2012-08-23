Uxme::Application.routes.draw do

  root to: 'pages#home'
  # match '/ui(/:action)', controller: 'ui'
  match '/thanks', to: "pages#thanks", as: :thanks
  match '/about', to: "pages#about", as: :about
  match '/process', to: "pages#our_process", as: :process
  match '/contact', to: "pages#contact", as: :contact

  resources :quotes
  resources :pages

end
