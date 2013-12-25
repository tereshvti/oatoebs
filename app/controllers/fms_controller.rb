class FmsController < ApplicationController
  def index
	@forms = FndFormVl.search(params[:search], params[:page])
  end

  def show
    @form = Form.new 
	@form.init(params[:form_name] + '.xml')
	Dir.chdir("public/docs")
	@docs = Dir["*.xml"]
	Dir.chdir("../..")
	
	#unless params[:xml].nil?
	#	unless params[:xml].empty? 
	#		puts 'FROM XML !'
	#		@form.input_by_xml(params[:xml]) 
	#	else 
	#		puts 'FROM GUID !'
	#		guid = params[:guid]
	#		if guid 
	#			@form.input_by_guid guid
	#		end
	#	end
	#end
	
	guid = params[:guid]
	xml = params[:xml]

	unless guid.nil?
		puts 'from guid!'
	    @form.input_by_guid guid
	end
	
	unless xml.nil?
		puts 'from xml!'
	    @form.input_by_xml xml
	end
	
	unless @form.multirow_hash
		@form.input_by_guid 'lol'
	end
	
	respond_to do |format|
		format.js   # show.js.erb
		format.html   # show.html.erb
    end
  end

  def edit
  end
  
  def import_form_sqls
	Dir.chdir("public/xml_forms")
	fnames = Dir["*.sql"]
	Dir.chdir("../..")
	fnames.each do |filename|	
		filepath =  Dir.pwd + "/public/xml_forms/" + filename		
		content = File.open(filepath){ |file| file.read }
		fsqls = content.split('@')
		hash = {}
		fsqls.each do |fs|
			if fs.size>0
				hash['formname']=filename[0,filename.index('.')]
				hash['blockname']=fs[0,fs.index('!')]
				fs[fs.index("select")+8]=''
				hash['sql']=fs[fs.index("select"),fs.size]
				SqlQuery.create hash 
			end
		end
	end
  end
  
end
