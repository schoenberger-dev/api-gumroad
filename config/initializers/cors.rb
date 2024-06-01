Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # Specify which origins are allowed to make CORS requests
    origins 'localhost:3000', 'heygumroad.schoenberger.dev', 'heygumroad.schoenberger.dev'

    # Specify which resources are allowed and which methods and headers are supported
    resource '/api/*',
             headers: :any,
             methods: %i[get post put patch delete options head]
  end
end
