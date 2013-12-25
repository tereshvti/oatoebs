class TssController < ApplicationController
  def index
    @suites = Suite.all(:order => 'name')
  end

  def get_steps
	@script = Script.find(params[:id])
	respond_to do |format|
		format.js   # get_steps.js.erb
    end
  end
  
  def get_form
	@form = Form.new 
	@form.init(params[:form] + '.xml')
  	respond_to do |format|
		format.js   # get_form.js.erb
    end
  end
  
  def find_function
	name = params[:function_name]
	@fns = Function.where("lower(name) LIKE '%#{name.downcase}%'").first(30)
	puts @fns
	respond_to do |format|
		format.js   # find_function.js.erb
    end
  end
  
  def show
  end

  def monitor
  end
  
  def create_suite
    @suite = Suite.new
	@suite.name = params[:suite_name]
	@suite.save  
	#render :text => "Its ok" if suite.save  
	respond_to do |format|
		format.js   # create_suite.js.erb  # { render :action => "different_action" }
    end
  end
  
  def create_script
    scr = Script.new
	scr.suite_id = params[:suite_id]
	scr.name = params[:script_name]
	scr.responsible= params[:responsible]
	scr.save
	respond_to do |format|
		format.js # create_script.js.erb 
    end
  end
  
  def create_step
    @script = Script.find(params[:script_id])
    step = Step.new
	step.function_id = params[:fn_id]
	step.script_id = params[:script_id]
	#render :text => "Its ok" if step.save  
	step.save 
	respond_to do |format|
		format.js # create_step.js.erb 
    end
  end
  
  def create_arg_instance
	step_id, arg_id = params[:step_arg_ids].split('_')
	arg_instance = Argument.find(arg_id).argument_instances.find_by_step_id(step_id)
	unless arg_instance
		arg_instance = ArgumentInstance.new
		arg_instance.step_id = step_id
		arg_instance.argument_id = arg_id
	end
	arg_instance.value = params[:value]
	render :text => "Its ok" if arg_instance.save
  end
  
  def destroy_script
	script = Script.find(params[:script])
	script.destroy
	respond_to do |format|
		format.js   # destroy_script.js.erb
    end
  end
  
  def destroy_suite
	suite = Suite.find(params[:suite])
	suite.destroy
	respond_to do |format|
		format.js   # destroy_suite.js.erb
    end
  end

end
