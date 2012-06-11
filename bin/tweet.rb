require 'rubygems'
require 'oauth'
require 'Twitter'

ConsumerKey = 'QHLmvGHLsa9ZFjc8ksLoEg'
ConsumerKeySecret = 'ET321jchZUj41D1mkOrXw3QYwXlC7nYfGBeZRSc4'

OAuthToken = '6331652-Gb1LKSj7qfQaMpz8DaYCrQLsJO3PdmygMKzlBERiy6'
OAuthSecret = 'cU1jO2RsArp3lOx4CkiL6qIMW6CJiMzXAzllKkXgrE'

# Initialize Process
#consumer = OAuth::Consumer.new(ConsumerKey, ConsumerKeySecret,:site => 'http://twitter.com') 
#request_token = consumer.get_request_token 
#puts "Please access URL and input Verifier"
#puts request_token.authorize_url 
#verifier = gets.chop 
#access_token = request_token.get_access_token(:oauth_verifier => verifier); 
#puts access_token.token
#puts access_token.secret
#exit

# Tweet Process

Twitter.configure do |config|
	config.consumer_key = ConsumerKey
	config.consumer_secret = ConsumerKeySecret
	config.oauth_token = OAuthToken
	config.oauth_token_secret = OAuthSecret
end

if (ARGV[0] == nil)
	exit(1)
end

msg = ARGV[0]

if (msg.length > 140)
	puts 'Over 140 length'
else
	Twitter.update(msg)
#	puts msg

end

#Twitter.update("muhu---")
