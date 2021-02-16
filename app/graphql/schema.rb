class Schema < GraphQL::Schema
  query(Types::QueryType)

  use GraphQL::Schema::Timeout, max_seconds: 30

  query_analyzer Analyzer

  instrument :query, GraphQL::Metrics::Instrumentation.new
  tracer GraphQL::Metrics::Tracer.new

  max_complexity 300
  max_depth 50
end
