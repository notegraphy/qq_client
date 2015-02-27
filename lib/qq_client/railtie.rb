# -*- encoding : utf-8 -*-
module QqClient
  class Railtie < ::Rails::Railtie
  	after_initialize do
    #initializer "Charge rails qq_client configuration" do
      QqClient::Config.load_config
    end
  end
end
