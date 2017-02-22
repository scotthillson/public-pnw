
# Change to match your CPU core count
workers 1

# Min and Max threads per worker
threads 1, 16

# Default to production
rails_env = ENV['RAILS_ENV'] || "production"
environment rails_env

