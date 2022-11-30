Rails.application.routes.draw do
  if Rails.env.development?
    get '/graphiql' => 'graphiql#show'
  end

  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
