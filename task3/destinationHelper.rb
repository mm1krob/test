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