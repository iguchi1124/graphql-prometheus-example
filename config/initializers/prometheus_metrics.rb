require 'prometheus/client/data_stores/direct_file_store'
Prometheus::Client.config.data_store = Prometheus::Client::DataStores::DirectFileStore.new(dir: Rails.root.join('tmp', 'prometheus'))

prometheus = Prometheus::Client.registry

prometheus_graphql_operation_counter =
  prometheus.counter(
    :graphql_operations_total,
    docstring: 'The total number of GraphQL operations handled by the Rails application.',
    labels: %i(operation_type operation_name),
  )

prometheus_graphql_operation_histogram =
  prometheus.histogram(
    :graphql_operation_duration_seconds,
    docstring: 'The GraphQL response duration handled by the Rails application.',
    labels: %i(operation_type operation_name),
  )

Rails.application.config.x.prometheus_graphql_operation_counter = prometheus_graphql_operation_counter
Rails.application.config.x.prometheus_graphql_operation_histogram = prometheus_graphql_operation_histogram
