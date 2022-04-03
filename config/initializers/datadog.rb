# frozen_string_literal: true

return if ENV["DD_AGENT_HOST"].blank? || ENV["DD_TRACE_AGENT_PORT"].blank?

require "ddtrace"
Datadog.configure do |c|
  c.use(:rails)
  c.use(:rack)

  c.distributed_tracing.propagation_inject_style = [Datadog::Ext::DistributedTracing::PROPAGATION_STYLE_B3]
  c.distributed_tracing.propagation_extract_style = [Datadog::Ext::DistributedTracing::PROPAGATION_STYLE_B3]

  c.tracer(tags: {
    "lightstep.service_name" => "jazzify-webapp",
    "lightstep.access_token" => Rails.application.credentials.lightstep[:access_token],
    "lightstep.env" => Rails.env,
  })
end
