# -*- encoding : utf-8 -*-
module QqClient
  module Config

    class << self
      attr_reader :app_key, :app_secret, :redirect_uri

      filename = "#{Rails.root}/config/initializers/qq_client_config.rb"

      def load_config(app_key, app_secret, redirect_uri)
        if app_key.nil? || app_secret.nil? || redirect_uri.nil?
          return unless self.check_config_file
          require filename 
          #@app_key = (app_key.nil?) ? QQ_CONNECT_API_KEY : app_key
          #@app_secret = (app_secret.nil?) ? QQ_CONNECT_API_SECRET : app_secret
          #@redirect_uri = (redirect_uri.nil?) ? QQ_CONNECT_REDIRECT_URI : redirect_uri
          @app_key = (app_key.nil?) ? nil : app_key
          @app_secret = (app_secret.nil?) ? nil : app_secret
          @redirect_uri = (redirect_uri.nil?) ? nil : redirect_uri
        end
      end

      def check_config_file
        true
        unless File.exist?(filename)
          puts "|>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
          puts "|"
          puts "Please configure qq app_id app_key redirect_uri in #{filename}."
          puts "|"
          puts "|>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
          false
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
