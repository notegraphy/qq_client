# -*- encoding : utf-8 -*-
module QqClient
  module Config

    class << self
      attr_reader :app_key, :app_secret, :redirect_uri

      def load_config(app_key, app_secret, redirect_uri)
        begin
          filename = "#{Rails.root}/config/initializers/qq_client_config.rb"
          if self.check_config_file(filename)
            require filename
            @app_key = (app_key.nil?) ? QQ_CONNECT_API_KEY : app_key
            @app_secret = (app_secret.nil?) ? QQ_CONNECT_API_SECRET : app_secret
            @redirect_uri = (redirect_uri.nil?) ? QQ_CONNECT_REDIRECT_URI : redirect_uri
          else
            @app_key = app_key
            @app_secret = app_secret
            @redirect_uri = redirect_uri
          end
            {
                app_key: @app_key,
                app_secret: @app_secret,
                redirect_uri: @redirect_uri
            }
        rescue => e
          puts e => e.message
        end
      end

      def check_config_file(filename)
        result = true
        unless File.exist?(filename)
          puts "|>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
          puts "|"
          puts "Please configure qq app_id app_key redirect_uri in #{filename}."
          puts "|"
          puts "|>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
          result = false
        end
        result
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
