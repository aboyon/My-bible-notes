class VerseController < ApplicationController

	#URL example http://es.bibles.org/chapters/RVR95:Gen.2.json
	def search
		raw_response = Typhoeus::Request::get(
			"https://m.es.bibles.org/passages.xml?q[]=#{params[:criteria].gsub(' ','%20')}&version=#{params[:version]}",
			:follow_location => true, 
			:ssl_verifyhost => false, 
			:username => APP_CONFIG['BIBLESEARCH_API_KEY'],
			:password => 'X'
		)
		if (raw_response.success?)
			@response  = XmlSimple.xml_in(raw_response.body)
			if (@response['result'].length == 0) 
				@response = {:error => 'Verse or passage not found'}
			end				
		else
			@response = {:error => 'An error ocurred', :message => raw_response.body}
		end
		
		respond_to do |format|
	      format.html
	      format.json { render json: @response }
	    end
	end

end