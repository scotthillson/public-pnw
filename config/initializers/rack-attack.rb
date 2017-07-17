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
  throttle('req/ip', :limit => 80, :period => 10.minutes) do |req|
    req.ip unless req.path.start_with?('/assets')
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

  self.blocklist('block shitheads') do |req|
    # Requests are blocked if the return value is truthy
    req.ip == '199.48.160.67' ||
    req.ip == '199.48.160.81' ||
    req.ip == '162.216.152.60' ||
    req.ip == '162.216.152.53' ||
    req.ip == '158.69.132.117' ||
    req.ip == '149.56.81.59' ||
    req.ip == '144.217.173.212' ||
    req.ip == '144.217.34.60' ||
    req.ip == '144.217.173.209' ||
    req.ip == '104.236.132.102' ||
    req.ip == '89.248.163.3' ||
    req.ip == '81.133.25.236' ||
    req.ip == '80.92.242.116' ||
    req.ip[0..5] == '65.208'
  end

end
