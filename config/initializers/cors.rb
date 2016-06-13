GearList::Application.config.middleware.insert_before(0, "Rack::Cors", {
  :debug => true,
  :logger => (-> { Rails.logger })
}) do
  allow do
    origins 'gear-list.com'
    resource '*', :headers => :any, :methods => :any
  end
end
