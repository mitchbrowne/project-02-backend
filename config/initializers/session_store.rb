if Rails.env === 'production' 
    # modify domain name fater deployment
    Rails.application.config.session_store :cookie_store, key: '_compaign-markt', domain: 'https://campaign-markt.herokuapp.com/'
  else
    Rails.application.config.session_store :cookie_store, key: '_compaign-markt' 
  end