ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])

module DefaultOptions
  def default_options
    super.merge(Host: '0.0.0.0', Port: 80)
  end
end
