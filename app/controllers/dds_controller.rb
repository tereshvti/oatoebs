# coding: utf-8
class DdsController < ApplicationController
  def index
  @ddts = XxtRdDocType.search(params[:doc_group],params[:doc_type], params[:page])
  end

  def show
  end
end
