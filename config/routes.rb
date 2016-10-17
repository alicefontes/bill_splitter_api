Rails.application.routes.draw do
    get '/items', to: 'product#list'
    get '/item/:id', to: 'product#show'
    put '/item/:id', to: 'product#edit'
    post '/items', to: 'product#new'
    delete '/item/:id', to: 'product#delete'
end
