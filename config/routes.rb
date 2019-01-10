Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"

  # Add graphiql engine and set the root page to it in dev env
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
    root to: redirect('/graphiql')
  end
end
