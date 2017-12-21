module DestinationParser
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
end