unless Rails.env.test?
  log_level = String(ENV['LOG_LEVEL'] || "info").upcase
  GearList::Application.config.logger = Logger.new(STDOUT)
  GearList::Application.config.logger.level = Logger.const_get(log_level)
  GearList::Application.config.log_level = log_level
end

