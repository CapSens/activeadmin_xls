module ActiveadminXls
  class Railtie < Rails::Railtie
    # This defines configuration items meant to be overriden
    # in the client application.rb file.
    config.activeadmin_xls = ActiveSupport::OrderedOptions.new
    config.activeadmin_xls.delete_columns = []
    config.activeadmin_xls.per = 200
  end
end
