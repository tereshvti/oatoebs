class TrOperation < ActiveRecord::Base
	
	has_many :functions

	def self.search(code, summary, event, page)
		code = "%" if code.to_s.eql?("") or code.nil? 
		summary = "%" if summary.to_s.eql?("")
		event = "%" if event.to_s.eql?("")
 
		seg = code.to_s.split('.')
		if seg.size>0 then segn6=seg[0] else segn6="%" end
		if seg.size>1 then segn0=seg[1] else segn0="%" end
		if seg.size>2 then segn1=seg[2] else segn1="%" end
		if seg.size>3 then segn2=seg[3] else segn2="%" end
		if seg.size>4 then segn3=seg[4] else segn3="%" end
		if seg.size>5 then segn4=seg[5] else segn4="%" end
		if seg.size>6 then segn5=seg[6] else segn5="%" end
		
		paginate :per_page => 30, :page => page,
			:conditions => ['(segn6 is null or segn6 like ?) and (segn0 is null or segn0 like ?) and (segn1 is null or segn1 like ?) and (segn2 is null or segn2 like ?) and (segn3 is null or segn3 like ?)  and (segn4 is null or segn4 like ?) and (segn5 is null or segn5 like ?) and lower(summary) like ? and lower(eventbegin) like ?', 
			"#{segn6}","#{segn0}","#{segn1}","#{segn2}","#{segn3}","#{segn4}","#{segn5}",
			"%#{summary}%","%#{event}%"]
	end
	
	def tr_code(id)
		r = TrOperation.find(id)
		t = r.segn6.to_s + '.' + r.segn0.to_s
		t = t + '.' + r.segn1.to_s if !r.segn1.to_s.empty? 
		t = t + '.' + r.segn2.to_s if !r.segn2.to_s.empty? 
		t = t + '.' + r.segn3.to_s if !r.segn3.to_s.empty? 
		t = t + '.' + r.segn4.to_s if !r.segn4.to_s.empty? 
		t = t + '.' + r.segn5.to_s if !r.segn5.to_s.empty? 
		@tr_code = t
	end 
end
