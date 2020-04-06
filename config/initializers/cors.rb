# Jacked from rack-cors Github documentation

Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*'   #change after deployment
      resource '*',
        :headers => :any,
        :methods => %i( get post put patch delete options head ),
        :credentials => false # set to true after deployment
    end
  end
