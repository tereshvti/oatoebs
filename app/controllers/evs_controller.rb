class EvsController < ApplicationController
	def index
	  @evs = TrEvent.search(params[:description], params[:event], params[:page])
	end

	def import_tr_events
		Dir.chdir("public/evs/")
		filelist = Dir["*.*"]
		Dir.chdir("../..")
		kh = {
		"303" => "eventbegin", "319" => "action",
		"name" => "description", "text" => "doc",
		"revision" => "revision",
		"date" => "revdate",
		"root tag" => "spto45roottag"
		} 

		filelist.each do |el|
			filepath =  Dir.pwd + "/public/evs/" + el
			f = File.open(filepath)
			doc = Nokogiri::XML(f)
			f.close
			
			result = doc.xpath("//*[@type=\"3\"]");     
			op=[]
			result.each do |r|
				op << r.get_attribute("disp")
			end
			op.each do |p|
				query = "//*[@disp=\"" << p << "\"]/*[@type=\"9\"]"
				result = doc.xpath(query);
				temp = Hash.new
				result.each do |r|
					temp[kh[r.get_attribute("key")]] = r.get_attribute("disp")
				end
				query = "//*[@disp=\"" << p << "\"]/*[@name=\"revision\" or @name=\"date\" or @name=\"root tag\" or @name=\"name\" or @name=\"text\"]"
				result = doc.xpath(query);
				result.each do |r|
					temp[kh[r.get_attribute("name")]] = r.get_attribute("value")
				end
				puts '\n----------------\n' 
				puts temp
				TrEvent.create temp
			end			
		end 
	end
  
end
