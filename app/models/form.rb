class Form
include ActiveModel::Validations
include ActiveModel::Conversion
extend ActiveModel::Naming

	attr_accessor :name, :tabs, :queries, :multirow_hash
	
	def init(filename)
		self.name = filename[0,filename.index('.')]
		filepath =  Dir.pwd + "/public/xml_forms/" + filename
		f = File.open(filepath)
		doc = Nokogiri::XML(f)
		f.close
		self.tabs = doc.search('TabPage')
	end
	
	def get_queries
		self.queries = {}
		SqlQuery.where(:formname => self.name).each do |query|
			self.queries[query.blockname] = query.sql
		end
	end

	 def input_by_guid(guid)
		 puts 'lets input'
		 self.get_queries     
		 conn = OCI8.new('apps', 'pfctrhtxty', 'ur7e')
		 touched_blocks = []
		 result_hash = {}
		 self.multirow_hash = {}
		 self.tabs.each do |tab|
			 tab.search('Canvas').each do |canvas|
				 multirow = canvas.get_attribute('Multirow')
				 block = canvas.search('Field')[0].get_attribute('BlockName')
				
				 if multirow.eql? 'N' 
					 unless touched_blocks.include? block
						 touched_blocks << block
						 full_sql_query = self.queries[block] + "'" + guid + "'"
						 result_hash[block] = conn.exec(full_sql_query).fetch_hash
					 end
					 canvas.search('Field').each do |field|
						 unless result_hash[block].nil?
						 field.content = result_hash[block][field.get_attribute('Name')]
						 #puts field.content
						 end
					 end
				 else
						 lines = []
						 unless touched_blocks.include? block
								 touched_blocks << block
								 full_sql_query = self.queries[block] + "'" + guid + "'"
								 conn.exec(full_sql_query) do |line|
										 lines << line
								 end
								 col_names = conn.exec(full_sql_query).get_col_names
								 lines << ' ' if lines.empty?
								 self.multirow_hash[col_names] = lines
						 end
				 end
			 end
		 end
	 end
	
	def input_by_xml(file)
		filepath =  Dir.pwd + "/public/docs/" + file
		f = File.open(filepath)
		xml_in = Nokogiri::XML(f)
        puts xml_in
		f.close
		self.multirow_hash = {}
		self.tabs.each do |tab|
			tab.search('Canvas').each do |canvas|
				multirow = canvas.get_attribute('Multirow')
				
				if multirow.eql? 'N' 
					canvas.search('Field').each do |field|
						field.content = xml_in.search(field.get_attribute('Name'))[0].content
						field.content = xml_in.search(".//Canvas/Field[@Name='#{field.get_attribute('Name')}']")[0].content
					end
				else
					col_names = []
					lines = []
					#xml_in.search(".//#{canvas.get_attribute('CanvasName')}/LINE").each do |l|
					xml_in.search(".//Canvas[@Name='#{canvas.get_attribute('CanvasName')}']/LINE").each do |l|
						line = []
						canvas.search('Field').each do |field|
							line << l.search(field.get_attribute('Name'))[0].content
							line << l.search("./Field[@Name='#{field.get_attribute('Name')}']")[0].content
							col_names << field.get_attribute('Name')
						end
						lines << line
					end
					self.multirow_hash[col_names] = lines
				end
			end
		end
	end

end
