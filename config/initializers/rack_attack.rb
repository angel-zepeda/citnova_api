class Rack::Attack
  # restringe cualquier peticion excepto localhost max 5 peticiones por segundo
  # more examples and doc https://github.com/kickstarter/rack-attack/wiki/Example-Configuration
  safelist('allow from localhost') do |req|
    # Requests are allowed if the return value is truthy
    '127.0.0.1' == req.ip || '::1' == req.ip
  end
 
  throttle('req/ip', :limit => 5, :period => 1.second) do |req|
    req.ip
  end
end
