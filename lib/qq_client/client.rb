require "rest_client"

module QqClient
	class Client
		attr_reader :oauth

		def initialize(access_token)
			@oauth = Oauth.new(access_token)
		end

		################# API

		# Get Tencent Weibo user's login information.
		# More info (http://wiki.connect.qq.com/get_info)
		def get_info(uid, options = {})
			@oauth.get uid, "user/get_info", options
		end

		# Published a microblogging message (plain text) to the Tencent microblogging platforms.
		# More info (http://wiki.connect.qq.com/add_t)
		def add_t(uid, content, options = {})
			default_params = { :content => content }
			@oauth.post uid, "t/add_t", default_params.merge(options)
		end

		# Upload a picture and posted a message on the Tencent microblogging platforms.
		# More info (http://wiki.connect.qq.com/add_pic_t)
		def add_pic_t(uid, content, pic, options = {})
			default_params = { :content => content,:pic => pic }
			@oauth.post uid, "t/add_pic_t", default_params.merge(options)
		end

		def add_blog(uid, title, content)
			params = { :content => content,:title => title,:format => 'json' }
			@oauth.post uid, "blog/add_one_blog", params
		end

	end
end
