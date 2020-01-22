Rails.application.routes.draw do
  devise_for :users
	root 'welcome#index'
	get 'my_portfolio', to: 'users#my_portfolio'
	get 'search_items', to: 'items#search'
	post 'add_item', to: 'user_items#create'
 	resources :user_items, only: [:create, :destroy]
	get 'my_friends', to: 'users#my_friends'
	resources :users, only: [:show]
	resources :friendships
	get 'search_friends', to: 'users#search'
	post 'add_friend', to: 'users#add_friend'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
