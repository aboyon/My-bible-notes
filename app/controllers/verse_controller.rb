class VerseController < ApplicationController

	#URL example http://es.bibles.org/chapters/RVR95:Gen.2.json
	def search
		#@response = "http://es.bibles.org/chapters/RVR95:#{params[:criteria]}.json";
		@response = Hash.from_xml(%x{curl -L -u "#{APP_CONFIG['BIBLESEARCH_API_KEY']}":X -k http://es.bibles.org/chapters/RVR95:#{params[:criteria]}.json})
	end

end