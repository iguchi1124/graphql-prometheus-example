class Schema < GraphQL::Schema
  query(Types::QueryType)

  use GraphQL::Schema::Timeout, max_seconds: 30
end
