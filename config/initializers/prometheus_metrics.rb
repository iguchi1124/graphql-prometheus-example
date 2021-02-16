prometheus = Prometheus::Client.registry

prometheus_graphql_operation_counter =
  Prometheus::Client::Counter.new(
    :graphql_operations_total,
    docstring: 'The total number of operations handled by the Rails application.',
    labels: %i(operation_type operation_name),
  )

prometheus.register(prometheus_graphql_operation_counter)

Rails.application.config.x.prometheus_graphql_operation_counter = prometheus_graphql_operation_counter
