Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "*" #after change to front end domain 
    resource "*",
      headers: :any,
      methods: [:post],
      expose: [:Authorization]
  end
end
