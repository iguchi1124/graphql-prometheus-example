class Schema < GraphQL::Schema
  query(Types::QueryType)

  use GraphQL::Schema::Timeout, max_seconds: 30

  use GraphQL::Execution::Interpreter
  use GraphQL::Analysis::AST

  query_analyzer Analyzer

  instrument :query, GraphQL::Metrics::Instrumentation.new
  tracer GraphQL::Metrics::Tracer.new

  max_complexity 100
  max_depth 10
end
