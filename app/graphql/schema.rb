class Schema < GraphQL::Schema
  query(Types::QueryType)

  use GraphQL::Schema::Timeout, max_seconds: 30

  max_complexity 100
  max_depth 10
end
