require 'net/http'
require 'json'


class DestinationParser
 
 	def distance_between_cities(origins, destinations);
		url = URI.parse("https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=#{origins}&destinations=#{destinations}&key=AIzaSyCY05U4IKsK-Wkb38WwyZOKPgOH6s8j_JI");
		http = Net::HTTP.get(url);
		http = Net::HTTP.new(url.host, url.port);
		http.use_ssl = true;
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE;
		request = Net::HTTP::Get.new(url.request_uri);
		response = http.request(request);
		js = JSON.parse(response.body);
		puts "#{origins} - #{destinations}, #{js['rows'][0]['elements'][0]['distance']['text']}, #{js['rows'][0]['elements'][0]['duration']['text']}";
	end
end

blala=DestinationParser.new;

blala.distance_between_cities('lviv', 'morshyn');

