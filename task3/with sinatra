require 'net/http'
require 'json'
require 'sinatra'

get '/distance_from=:city1?distance_to=:city2' do
 
module DestinationHelper
class Https
	def initialize(city1,city2)
		url = URI.parse("https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=#{city1}&destinations=#{city2}&key=AIzaSyCY05U4IKsK-Wkb38WwyZOKPgOH6s8j_JI");
		http = Net::HTTP.get(url);
		http = Net::HTTP.new(url.host, url.port);
		http.use_ssl = true;
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE;
		request = Net::HTTP::Get.new(url.request_uri);
		@response = http.request(request);
	end
	def getResponse()
		return @response.body;
	end
end
end


class DestinationParser
	def validArg(arg1,arg2)
		if  arg1=='' or arg2=='' 
			raise ArgumentError, 'Argument must be field'
		elsif arg1.is_a? Numeric  or arg2.is_a? Numeric
			raise ArgumentError, 'Argument is not string'
		end
	end
	
 	def distance_between_cities(origins, destinations);
			begin
			self.validArg(origins, destinations)
			rescue ArgumentError => er
			puts er.message + '! Cities going to set by defalt(lviv, kiev)'
			origins='lviv'
			destinations='kiev'
			end
			net = DestinationHelper::Https.new(origins, destinations)
			js = JSON.parse(net.getResponse);
			return "#{origins} - #{destinations}, #{js['rows'][0]['elements'][0]['distance']['text']}, #{js['rows'][0]['elements'][0]['duration']['text']}";
		
	end
end
blala=DestinationParser.new;

a=blala.distance_between_cities(params['city1'], params['city2']);
 a;
end;
