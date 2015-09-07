PortfolioBlog::Application.routes.draw do
  resources :media

  resources :html_snippets

  resources :roles

  get "sessions/new"

  get "pages/home"

  resources :users

  resources :comments

  resources :categories

  resources :attachments

  resources :posts do
    collection do
      post 'edit_multiple'
      put 'update_multiple'
      get 'manage_selected_categories'
      post 'categorize_selected'
    end
  end

  namespace :api, constraints: {format: :json}, defaults: {format: :json} do
    namespace :v1 do
      namespace :admin do
        resources :blogs
      end
    end
  end

  resource :sessions

  root :to => 'pages#home'

end
