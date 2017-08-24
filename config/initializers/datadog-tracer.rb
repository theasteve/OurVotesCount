# config/initializers/datadog-tracer.rb

Rails.configuration.datadog_trace =
  {
    # may depend by your conditional env
    enabled: false,
    # these may be 'true' to keep parity with your production
    auto_instrument: true,
    auto_instrument_redis: true
  }
