class Rack::Attack
  
  ### Configure Cache ###
  
  # If you don't want to use Rails.cache (Rack::Attack's default), then
  # configure it here.
  #
  # Note: The store is only used for throttling (not blacklisting and
  # whitelisting). It must implement .increment and .write like
  # ActiveSupport::Cache::Store
  
  # Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new 
  
  ### Throttle Spammy Clients ###
  
  # If any single client IP is making tons of requests, then they're
  # probably malicious or a poorly-configured scraper. Either way, they
  # don't deserve to hog all of the app server's CPU. Cut them off!
  #
  # Note: If you're serving assets through rack, those requests may be
  # counted by rack-attack and this throttle may be activated too
  # quickly. If so, enable the condition to exclude them from tracking.
  
  # Throttle all requests by IP (60rpm)
  #
  # Key: "rack::attack:#{Time.now.to_i/:period}:req/ip:#{req.ip}"
  throttle('req/ip', :limit => 500, :period => 5.minutes) do |req|
    req.ip # unless req.path.start_with?('/assets')
  end
  
  self.throttled_response = lambda do |env|
    # Using 503 because it may make attacker think that they have successfully??
    # DOSed the site. Rack::Attack returns 403 for blocklists by default ??
    [ 503, {}, ['Please try again later']]
  end
  
  self.blocklisted_response = lambda do |env|
    # Using 503 because it may make attacker think that they have successfully
    # DOSed the site. Rack::Attack returns 403 for blocklists by default
    [ 503, {}, ['Please try again later']]
  end
  
end
