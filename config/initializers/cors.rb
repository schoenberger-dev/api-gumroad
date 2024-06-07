Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # Specify which origins are allowed to make CORS requests
    origins 'localhost:3000', 'gumroad.schoenberger.dev', %r{/https://gumroad-(.*)\.vercel\.app/}

    # Specify which resources are allowed and which methods and headers are supported
    resource '/api/*',
             headers: :any,
             methods: %i[get post put patch delete options head]
  end
end
