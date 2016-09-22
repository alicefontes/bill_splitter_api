Rails.application.routes.draw do
    get '/item', to: 'item#index'
    get '/item/:id', to: 'item#show'
    put '/item/:id', to: 'item#edit'
    post '/items', to: 'item#new'
    delete '/item/:id', to: 'item#delete'
end
