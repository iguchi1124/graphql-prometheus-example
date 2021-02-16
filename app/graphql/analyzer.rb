class Analyzer < GraphQL::Metrics::Analyzer
  def query_extracted(metrics)
    Rails.application.config.x.prometheus_graphql_operation_counter.increment(
      labels: {
        operation_type: metrics[:operation_type],
        operation_name: metrics[:operation_name],
      }
    )

    Rails.application.config.x.prometheus_graphql_operation_histogram.observe(
      metrics[:query_duration],
      labels: {
        operation_type: metrics[:operation_type],
        operation_name: metrics[:operation_name],
      }
    )
  end

  def field_extracted(*)
    # noop
  end

  def argument_extracted(*)
    # noop
  end
end
