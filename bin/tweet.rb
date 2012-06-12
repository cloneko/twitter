require 'rubygems'
require 'oauth'
require 'twitter'
require 'yaml'

Dir.chdir(File.dirname(__FILE__))
setting = YAML.load_file("setting.yaml")

ConsumerKey = setting["consumer"]["key"]
ConsumerKeySecret = setting["consumer"]["secret"]

OAuthToken = setting["oauth"]["token"]
OAuthSecret = setting["oauth"]["secret"]

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
	config.proxy = ENV['http_proxy']
end

if ARGV.empty?
	exit(1)
end

msg = ARGV[0]

if msg.split(//u).length > 140
	puts 'Over 140 length'
else
	Twitter.update(msg) 
end

