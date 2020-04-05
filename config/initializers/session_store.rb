if Rails.env === 'production' 
    # modify domain name fater deployment
    Rails.application.config.session_store :cookie_store, key: '_compaign-app', domain: 'your-frontend-domain'
  else
    Rails.application.config.session_store :cookie_store, key: '_compaign-app' 
  end