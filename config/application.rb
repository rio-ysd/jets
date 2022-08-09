require 'rack/session/dalli'

Jets.application.configure do
  config.project_name = 'app'
  config.mode = 'html'
  config.prewarm.enable = true
  config.autoload_paths = ["#{Jets.root}/lib"]
  config.function.role = "arn:aws:iam::#{Jets.aws.account}:role/DVNRubyOnJets"
  # config.function.timeout = 30
  # config.function.memory_size = 1536
  # config.function.dead_letter_config = {
  #   target_arn: 'arn:aws:sns:ap-northeast-1:748671410846:JetsErrorToSlack:15752935-6906-481d-8814-9e8ddf0e948f',
  # }
  # config.function.vpc_config = {
  #   security_group_ids: %w[sg-07619ffe090c1e1f8],
  #   subnet_ids: %w[subnet-de9a6ba8 subnet-90989bc9 subnet-c7a0fcef],
  # }
  # config.api.endpoint_type = 'PRIVATE' # Default is 'EDGE'
  # config.api.authorization_type = "AWS_IAM" # default is 'NONE' https://amzn.to/2qZ7zLh
  config.controllers.default_protect_from_forgery = false
  config.logger = Jets::Logger.new($stderr)
  config.logger = Jets::Logger.new($strerr)
  config.session.store = Rack::Session::Dalli
  config.session.options = {
    namespace: 'dvnorg:session',
    memcache_server: ENV.fetch('MEMCACHE_SERVER', 'memcached:11211'),
    pool_size: 10,
    key: "did#{Rails.env.production? ? '' : "_#{Rails.env}"}",
    path: '/',
    tld_length: ActionDispatch::Http::URL.tld_length + 1,
    expire_after: 14.days,
    secure: false,
    httponly: true,
  }
  config.force_ssl = true
  config.time_zone = 'UTC'
  ENV['TZ'] = 'UTC'

  Paranoia.default_sentinel_value = DateTime.new(0)
end
