# -*- encoding : utf-8 -*-
module QqClient
  module Config

    class << self
      attr_reader :app_key, :app_secret, :redirect_uri

      def load_config
        filename = "#{Rails.root}/config/initializers/qq_client_config.rb"
        if File.exist?(filename)
          require filename 
          @app_key = QQ_CONNECT_API_KEY
          @app_secret = QQ_CONNECT_API_SECRET
          @redirect_uri = QQ_CONNECT_REDIRECT_URI
        else
          puts "|>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
          puts "|"
          puts "Please configure qq app_id app_key redirect_uri in #{filename}."
          puts "|"
          puts "|>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
          return
        end
      end

      def temp_change_config(config)
        o_app_key, o_app_secret, o_redirect_url = @app_key, @app_secret, @redirect_uri
        @app_key, @app_secret, @redirect_uri = config.app_key, config.app_secret, config.redirect_uri
        result = yield
        @app_key, @app_secret, @redirect_uri = o_app_key, o_app_secret, o_redirect_url
        result
      end
    end


  end
end
