Rails.application.routes.draw do
    get '/item', to: 'item#index'
    post '/new', to: 'item#show_new_item'
    get '/delete', to: 'item#destroy_all'
end
