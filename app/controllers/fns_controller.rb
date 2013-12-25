class FnsController < ApplicationController
	def index 
		@fns = Function.search(params[:search], params[:page])
	end

	def show
	end
  
	def find_all
		@spto = params[:spto]
		doc = params[:doc]
		if XxtRdDocType.find_by_code(doc) 
			group = XxtRdDocType.find_by_code(doc).group_document
			@gr = group
		else group = '%'
		end
			puts group
			@trs = TrOperation.where("eventbegin LIKE '%#{@spto}%'")
			@evs = TrEvent.where("eventbegin LIKE '%#{@spto}%'")
			@ats = XxtBsTrActionsV.where("(tr_code LIKE '%#{@spto}%' OR techregl_select LIKE '%#{@spto}%') AND group_code LIKE '#{group}'")
			@obs = XxtBsOperation.where("(techregl_code LIKE '%#{@spto}%' OR techregl_select LIKE '%#{@spto}%') AND doc_group_code LIKE '#{group}'")
			puts @trs.count
			puts @evs.count			
			puts @ats.count
			puts @obs.count
			respond_to do |format|
			format.js   # find_all.js.erb
		end
	end
  
	def find_tr
		@trs = TrOperation.search(params[:code],params[:summary],params[:event],params[:page])
		puts @trs.size
		respond_to do |format|
			format.js   # find_tr.js.erb
		end
	end

	def find_tr_ev
		@evs = TrEvent.search(params[:description],params[:event],params[:page])
		puts @evs.size
		respond_to do |format|
			format.js   # find_tr_ev.js.erb
		end
	end
	
	def find_tr_act
		@ats = XxtBsTrActionsV.search(params[:doc_group],params[:doc_type],params[:action_code],params[:event],params[:page])
		puts @ats.size
		respond_to do |format|
			format.js   # find_tr_act.js.erb
		end
	end

	def find_tr_op
		@obs = XxtBsOperation.search(params[:doc_group],params[:doc_type],params[:user_operation_name],params[:event],params[:page])
		puts @obs.size
		respond_to do |format|
			format.js   # find_tr_op.js.erb
		end
	end

	def create
		func = Function.new
		func.name = params[:name]
		func.description = params[:description]
		func.tr_operation_id = params[:tr_id]
		func.tr_event_id = params[:tr_ev_id]
		func.xxt_bs_tr_actions_v_id = params[:tr_act_id]	
		func.xxt_bs_operation_id = params[:tr_op_id]
		# доделать!!
		unless func.save 
			render :text => "Function cannot be created"
		else
			if params[:arg]
				args = params[:arg]
				args.each do |k,a|
					arg = Argument.new
					a['form'].nil? ? arg.form = false : arg.form = true
					arg.name = a['name']
					arg.description = a['desc']
					arg.function = func
					arg.save
				end
			end
			redirect_to action: 'index'
		end
	end
  
	def destroy
		@function = Function.find(params[:id])
		@function.destroy
		redirect_to action: 'index'
	end
end
