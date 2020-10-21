Rails.application.routes.draw do
  get 'documents/index'
  get 'documents/new'
  get 'documents/create'
  get 'documents/destroy'
  resources :documents, only: [:index, :new, :create, :destroy, :show] do
    collection do
      get :download_or_destroy
    end
  end
  root "documents#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end