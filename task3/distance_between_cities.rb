require 'net/http'
require 'json'

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

class DestinationParser
 	def distance_between_cities(origins, destinations);
		if destinations.class!=String || origins.class!=String
			puts 'error: destination or origins should be a string'
		elsif origins=='' || destinations==''
			puts 'error: destination or origins should be filled'
		else
			
			net = Https.new(origins, destinations)
			js = JSON.parse(net.getResponse);
			puts "#{origins} - #{destinations}, #{js['rows'][0]['elements'][0]['distance']['text']}, #{js['rows'][0]['elements'][0]['duration']['text']}";
		end
	end
end
blala=DestinationParser.new;

blala.distance_between_cities('lviv', 'kiev');



