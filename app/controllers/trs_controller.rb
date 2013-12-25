class TrsController < ApplicationController
  def index
  @trs = TrOperation.search(params[:code], params[:summary], params[:event], params[:page])
  end

  def show
  end
  
def import_tr_operations
	Dir.chdir("public/trs/")
	filelist = Dir["*.*"]
	Dir.chdir("../..")
	kh = {
	"298" => "summary", "351" => "departament", "349" => "role", 
	"370" => "segn6", "361" => "segn0", "363" => "segn1", "362" => "segn2", "366" => "segn3", "364" => "segn4", "365" => "segn5", 
	"295" => "comment", 
	"352" => "indoc", "354" => "indepartament", "356" => "inrole", "330" => "inlocelecton", "331" => "inlocpaper", 
	"357" => "outdoc", "353" => "outdepartament", "355" => "outrole", "336" => "outlocelectron", "337" => "outlocpaper", 
	"341" => "sposobizmer", "421" => "dorabotka", "348" => "params",
	"320" => "termop", "342" => "status", "369" => "gendate", "302" => "eventbegin",
	"296" => "eventend",
	"revision" => "revision",
	"date" => "revdate",
	"root tag" => "spto45roottag"
	} 

	filelist.each do |el|
		filepath =  Dir.pwd + "/public/trs/" + el
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
			query = "//*[@disp=\"" << p << "\"]/*[@name=\"revision\" or @name=\"date\" or @name=\"root tag\"]"
			result = doc.xpath(query);
			result.each do |r|
				temp[kh[r.get_attribute("name")]] = r.get_attribute("value")
			end
			puts '\n----------------\n' 
			puts temp
			TrOperation.create temp
		end			
	end 
end
  
end
