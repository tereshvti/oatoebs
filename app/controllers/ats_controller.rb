class AtsController < ApplicationController
  def index
  @ats = XxtBsTrActionsV.search(params[:doc_group],params[:doc_type],params[:action_code],params[:event],params[:page])
  end
end
