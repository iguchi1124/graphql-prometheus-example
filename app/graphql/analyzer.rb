class Analyzer < GraphQL::Metrics::Analyzer
  def query_extracted(*)
    # noop
  end

  def field_extracted(*)
    # noop
  end

  def argument_extracted(*)
    # noop
  end
end
