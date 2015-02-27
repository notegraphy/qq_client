require "rest-client"

module QqClient
	class Client
		attr_reader :oauth
		
		def initialize(access_token)
			@oauth = Oauth.new(access_token)
		end

		################# API

		def get_info(uid, options = {})
			@oauth.get uid, "user/get_info", options
		end

		#发表一条微博信息到腾讯微博
		def add_t(uid, content, options = {})
			default_params = { :content => content }
			@oauth.post uid, "t/add_t", default_params.merge(options)
		end

		#上传图片并发表消息到腾讯微博
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
