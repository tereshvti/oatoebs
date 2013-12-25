class ObsController < ApplicationController
  def index
  @obs = XxtBsOperation.search(params[:doc_group],params[:doc_type],params[:user_operation_name],params[:event], params[:page])
  end

  def show
  end
  
  def import_doc_groups	
	  conn = OCI8.new('apps', 'pfctrhtxty', 'ur7e')
	  hash = {}
	  query = "select code,name from xxt_rd_doc_groups_v" 
	  conn.exec(query) do |line|
	     hash['code']=line[0]
		 hash['name']=line[1]
		 XxtRdDocGroup.create hash
	  end	  	
  end
  
  def import_doc_types	
	  conn = OCI8.new('apps', 'pfctrhtxty', 'ur7e')
	  hash = {}
	  query = "select code,name,group_document from xxt_rd_doc_types_v" 
	  conn.exec(query) do |line|
	     hash['code']=line[0]
		 hash['name']=line[1]
		 hash['group_document']=line[2]
		 XxtRdDocType.create hash
	  end	  	  
  end

  def import_tr_actions	
	  conn = OCI8.new('apps', 'pfctrhtxty', 'ur7e')
	  hash = {}
	  query = "select tr_code,techregl_select,group_code, doc_types,action_code,for_group_only from xxt_bs_tr_actions_v a
		join xxt_bs_tr_group_links_v g on a.link_id=g.link_id" 
	  conn.exec(query) do |line|
	     hash['tr_code']=line[0]
		 hash['techregl_select']=line[1]
		 hash['group_code']=line[2]
		 hash['doc_types']=line[3]
		 hash['action_code']=line[4]
		 if line[5].eql? 'Y'
			hash['for_group_only']=true
		 else		
			hash['for_group_only']=false
		 end	
		 XxtBsTrActionsV.create hash
	  end	  	  
  end
  
  def import_bs_operations	
	  conn = OCI8.new('apps', 'pfctrhtxty', 'ur7e')
	  hash = {}
	  query = "select doc_group_code, user_operation_name, operation_id, operation_code, stored_proc_name,
        techregl_code, techregl_select, initialization_type, group_oper_flag from xxt_bs_operations" 
	  col_names = conn.exec(query).get_col_names
	  conn.exec(query) do |line|
	     hash['doc_group_code']=line[0]
		 hash['user_operation_name']=line[1]
		 hash['operation_id']=line[2]
	     hash['operation_code']=line[3]
		 hash['stored_proc_name']=line[4]
		 hash['techregl_code']=line[5]
	     hash['techregl_select']=line[6]
		 hash['initialization_type']=line[7]
		 hash['group_oper_flag']=line[8]		 
		 
		 XxtBsOperation.create hash
	  end	  	  
  end
  
  def import_fnd_form_vl	
	  conn = OCI8.new('apps', 'pfctrhtxty', 'ur7e')
	  hash = {}
	  query = "select form_id,form_name, user_form_name from fnd_form_vl where application_id=20003" 
	  conn.exec(query) do |line|
	     hash['form_id']=line[0]
		 hash['form_name']=line[1]
		 hash['user_form_name']=line[2]
		 FndFormVl.create hash
	  end	  	  
  end  
  	
end
